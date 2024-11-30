create table person
(
    id            int primary key generated by default as identity,
    name          varchar(120) NOT NULL,
    gender        Varchar      NOT NULL, -- 0=любой 1=женщина 2=мужчина
    date_of_birth date         NOT NULL
);

create table indicator
(
    id        int primary key generated by default as identity,
    name      varchar(100) NOT NULL,
    gender    VARCHAR      NOT NULL,
    max_age   int          NOT NULL,
    min_age   int          NOT NULL,
    max_value numeric      NOT NULL,
    min_value numeric      NOT NULL
);

create table person_indicator
(
    id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    person_id     int REFERENCES person (id),
    indicator_id  int REFERENCES indicator (id),
    current_value numeric
);

create table transcript (
    id int GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100),
    fall jsonb,
    raise jsonb
);


INSERT INTO transcript (name, fall, raise) VALUES (
      'hemoglobin.json',
      '[
        "дефицит белка/меди/марганца/витамина С/витамина В1/В9/В12",
        "недостаточное поступление железа и/или его плохое усвоение",
        "скрытые/явные кровопотери",
        "инфекция Helicobacter pylori",
        "беременность",
        "эрозии и язвы в желудке"
      ]'::jsonb,
      '[
        "показатель гипоксии",
        "обезвоживание",
        "переутомление",
        "курение",
        "синдром раздраженного кишечника",
        "сахарный диабет"
      ]'::jsonb
);

INSERT INTO transcript (name, fall, raise) VALUES (
  'hematocrit',
  '["анемии любого рода","скрытые и явные","кровопотери","беременность","гипергидратация"]'::jsonb,
  '["гиперпротеинемия","отеки из-за нарушения функции почек","обезвоживание организма","гематологические заболевания"]'::jsonb
);

INSERT INTO transcript (name, fall, raise) VALUES (
  'erythrocyte',
  '["скрытое воспаление","дефицит В6, В12 и/или В9 (при этом будет повышен MCV)","заболевания почек (при этом будут отклонения в креатинине)","беременность","токсичные металлы","катаболизм"]'::jsonb,
  '["дефицит железа","истинная полицитемия","обезвоживание","курение"]'::jsonb
);

insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'both', 7, 0, 220, 180);
insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'both', 29, 8, 180, 150);
insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'both', 180, 30, 120, 90);
insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'both', 1825, 181, 140, 120);
insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'both', 4380, 1826, 150, 125);
insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'female', 54750, 4381, 160, 125);
insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hemoglobin.json', 'male', 54750, 4381, 170, 130);

insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('erythrocyte.json', 'male', 54750, 4381, 4.5, 5.5);

insert into indicator(name, gender, max_age, min_age, max_value, min_value)
VALUES ('hematocrit.json', 'male', 54750, 4381, 40, 54);