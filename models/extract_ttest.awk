# usage - awk -f 'extract_ttest.awk' model_performance.txt > ttest_results.csv

# inputs generated with:
# $ grep -o -P "Performance.*$" results/*/results.txt > bond_performance.txt

{
    model = $1
    t = $3
    p = $5
    l = $11
    r_5 = $13
    r = $15
    r_95 = $17
    
    gsub(",","", t)
    gsub(",","", p)
    gsub(",","", l)
    gsub(",","", r_5)
    gsub(",","", r)
    gsub(",","", r_95)

    gsub("^[^/]*/","", model)
    gsub("/.*$", "", model)

    printf "%s;%s;%s;%s;%s;%s;%s\n", model, t, p, l, r_5, r, r_95
}
