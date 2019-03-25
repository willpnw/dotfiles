# Defined in - @ line 0
function att --description 'Run the same command across all repos'
    for dir in /home/will/Rail/rail-stage2 /home/will/Rail/rail-stage2-ext /home/will/Rail/rail-uboot-env/ /home/will/Rail/rail-uboot_2015/ /home/will/Rail/rail/ /home/will/Rail/rail/rail-ux
        echo -n (basename $dir)": "
        pushd $dir > /dev/null
        eval $argv
        popd > /dev/null
    end
end
