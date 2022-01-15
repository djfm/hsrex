CREATE TABLE AutomationScenario (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    description TEXT DEFAULT null,
    createdat TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    updatedat TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
ALTER TABLE AutomationScenario ADD CONSTRAINT AutomationScenario_title_key UNIQUE(title);
CREATE TABLE AutomationScript (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    scenarioid UUID NOT NULL,
    stepid UUID NOT NULL
);
CREATE TABLE AutomationStep (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    instruction TEXT NOT NULL,
    params JSONB NOT NULL
);
ALTER TABLE AutomationScript ADD CONSTRAINT id FOREIGN KEY (scenarioid) REFERENCES automationscenario (id) ON DELETE NO ACTION;
ALTER TABLE AutomationScript ADD CONSTRAINT id FOREIGN KEY (stepid) REFERENCES automationstep (id) ON DELETE NO ACTION;
