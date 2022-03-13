age = 70;
sex = 'M';
ethnicity = 'Caucasican';
weight = 90; % kg
height = 175; % cm
smoker = 1;
activity = 0;
daily_carbs = 0 %number of carbs portions ingested per day
daily_fats = 0 %number of fat portions ingested per day
parent = 0;
diabetes = 0;
hypertension = 0;
pancreatic = 0;
polycystic = 0;
gestational = 0;
drugs = 'Lurasidone';
risk = 0;


if strcmp(ethnicity,'Native american')
    risk = risk+5;
elseif strcmp(ethnicity,'Black')
    risk = risk+5;
elseif strcmp(ethnicity,'Hispanic')
    risk = risk + 3;
elseif strcmp(ethnicity,'Asian')
    risk = risk + 3;
end

bmi = weight/(height/100)^2;
risk = risk + 50/20*(bmi-20);

if smoker == 1
    risk = risk + 20;
end

risk = risk + (4-activity)*20/4;

if parent == 1
    risk = risk + 20;
end

if hypertension == 1
    risk = risk + 20;
end

if polycystic == 1
    risk = risk + 10;
end

if gestational == 1
    risk = risk + 20;
end

if pancreatic == 1
    risk = risk + 10;
end

diet=daily_carbs+daily_fats
risk=risk+(diet-3)*5

if age >= 45
    risk = risk*(0.3/45*(age-35)+1);
end

if sex == 'M'
    risk = risk*1.1;
end

if diabetes == 1
    risk = 200;
end

if strcmp(drugs,'Chlorpromazine') || strcmp(drugs,'Clozapine') || strcmp(drugs,'Olanzapine')
    risk = risk*1.3;
elseif strcmp(drugs,'Quetiapine') || strcmp(drugs,'Risperidone') 
    risk = risk*1.2;
elseif strcmp(drugs,'Perphenazine') || strcmp(drugs,'Haloperidol') || strcmp(drugs,'Ziprasidone') || strcmp(drugs,'Aripiprazole') || strcmp(drugs,'Paliperidone') || strcmp(drugs,'Lurasidone') 
    risk = risk*1.1;    
end  
    	


risk
if risk > 130
    disp('Very high risk'); % same suggestions + go to the doctor % every day
elseif risk > 70
    disp('High risk'); % same suggestions + increase frequency of tests % 1 every 2 days
elseif risk > 45
    disp('Moderate risk'); % some suggestions for improving % 2 week
else
    disp('No/Low risk'); % no suggestions, all good % 1 week
end

%% suggestions
if smoker == 1 && risk>45
    disp('quit smoking')
end
if bmi>25 && risk>45
    disp('lose weight')
end
if activity<3 && risk>45
    disp('increase your weekly physical activity')
end
if diet>=3 && risk>45
    disp('reduce your carbs and fat intake')
end

%% gluc levels








