data = LOAD '/home/manas/Downloads/Datasets/googleplaystore.csv' USING PigStorage(',') as (appname:chararray, category:chararray, rating:float);
DUMP data;
group_cate = GROUP data by category;
DUMP group_cate;
indivitual_cate = foreach group_cate generate group as name, COUNT(data.category) as COUNT;
indivitual_cate = ORDER indivitual_cate by COUNT desc;
indivitual_cate = limit indivitual_cate 15;
DUMP indivitual_cate;

