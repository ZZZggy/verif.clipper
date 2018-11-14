require 'fileutils'

#############################################################################
# BEGIN FIXME TODO HACK
# Copy   acd_core/classifier2/sim/src/reg/*.svh
# Remove ../src/classifiers_regs.svh
# Copy   ../src/classifiers2_param_regs.svh -> ../src/classifiers_regs.svh
# Remove ../src/classifier2_Xni_regs.svh
# Remove ../src/classifiers2_Xni_globals_regs.svh
# Remove ../src/classifiers2_Xni_rule_info_regs.svh
# Remove ../src/classifiers2_Xni_pe_regs.svh
# Replace in outfiles: classifier2_Xni_regs.svh <-> classifier2_core_regs.svh
# Replace in outfiles: classifier2_Xni_*_.svh <-> classifier2_*_regs.svh
##############################################################################
dstDir = File.join(File.dirname(__FILE__), '../src/')
outfiles = File.readlines File.join(File.dirname(__FILE__), "../clipper2_top.sv")

begin
    File.delete File.join(dstDir,'classifiers_regs.svh')
rescue
end
begin
    FileUtils.cp(File.join(dstDir,'classifiers_param_regs.svh'), File.join(dstDir, 'classifiers_regs.svh'))
rescue
end

(1..8).each do |f|
    begin
        File.delete File.join(dstDir,'classifiers_p' + f.to_s + '_regs.svh')
    rescue
    end
    begin
        File.delete File.join(dstDir,'classifiers_p' + f.to_s + '_globals_regs.svh')
    rescue
    end
    begin
        File.delete File.join(dstDir,'classifiers_p' + f.to_s + '_rule_info_regs.svh')
    rescue
    end
    begin
        File.delete File.join(dstDir,'classifiers_p' + f.to_s + '_pe_regs.svh')
    rescue
    end
end

outfiles.map! { |o|
    if (o =~ /classifiers_p\d{1}_regs.svh/)
        '`include "../../../../../acd_core/classifier2/sim/src/reg/classifier2_core_regs.svh"'
    elsif (o =~ /classifiers_p\d{1}_globals_regs.svh/)
        '`include "../../../../../acd_core/classifier2/sim/src/reg/class2_globals_regs.svh"'
    elsif (o =~ /classifiers_p\d{1}_rule_info_regs.svh/)
        '`include "../../../../../acd_core/classifier2/sim/src/reg/class2_rule_info_regs.svh"'
    elsif (o =~ /classifiers_p\d{1}_pe_regs.svh/)
        '`include "../../../../../acd_core/classifier2/sim/src/reg/class2_pe_regs.svh"'
    else
        o
    end
}
outfiles.map! { |o| o.gsub(/\s+/, "") }
outfiles.uniq!
#outfiles.each{|o| puts "Outfile #{o}"}

File.open(File.join(File.dirname(__FILE__), "../clipper2_regdefs.sv"), "w+") do |f|
    f.write "\n"
    outfiles.each do |of|
        f.write "#{of}\n"
    end
end

##############################################################################
## END FIXME TODO HACK
##############################################################################
