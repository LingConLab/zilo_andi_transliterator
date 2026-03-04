library(tidyverse)
read_lines("zilo_andi_correspondences.txt") |> 
  str_split(pattern = ":", simplify = TRUE) |> 
  as_tibble(.name_repair = "unique_quiet") |> 
  rename(cyr = `...1`,
         lat = `...2`) ->
  result

result$cyr |> 
  map_chr(function(i){
    i <- tolower(i)
    i <- str_replace_all(i, "i", "I")
    str_glue('echo "{i}" | hfst-proc zilo_andi_cyrillic2ipa.hfstol') |> 
      system(intern = TRUE)
  }) ->
  analysis

'DELIMITERS = "<.>" "<!>" "<?>" "<...>";\n' |> 
  write_lines("zilo_andi_cyrillic2ipa.cg3")

result |> 
  mutate(analysis = analysis,
         analysis = str_remove(analysis, "\\$"),
         analysis = str_remove(analysis, "\\^.*?/"),
         analysis = str_split(analysis, "/")) |> 
  unnest_longer(analysis) |> 
  filter(lat != analysis) |> 
  mutate(cg3 = str_glue("REMOVE (/{analysis}/ri) ;\n", .trim = FALSE)) |> 
  distinct(cg3) |> 
  pull(cg3) |> 
  write_lines("zilo_andi_cyrillic2ipa.cg3", append = TRUE)
  