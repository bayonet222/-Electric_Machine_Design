% -------------------------------------------------------------------------
% TU Muenchen - Lehrstuhl fuer Fahrzeugtechnik (FTM)
% -------------------------------------------------------------------------
% Modell fuer den Entwurf und die Analyse einer PMSM oder ASM (MEAPA)
% -------------------------------------------------------------------------
% Autor:    Jonathan Erhard (jonathan.erhard@tum.de)
% Version:  v0.7 - 19.05.2019 - je
% -------------------------------------------------------------------------

% Elektroblech Materialien laden
list = dir('5_Materialien/1_Elektroblech');
if isempty(list)
    Elektroblech_List = [{'-'}];
else
    Elektroblech_List = {};
    for i = 1:length(list)
        if(length(list(i).name)>4 && strcmp(list(i).name(end-3:end),'.mat'))
            Elektroblech_List = [Elektroblech_List, {list(i).name(1:end-4)}];
        end
    end
    if isempty(Elektroblech_List)
        Elektroblech_List = [{'-'}];
    end
end

% Leiter Materialien laden
list = dir('5_Materialien/2_Leiter');
if isempty(list)
    Leiter_List = [{'-'}];
else
    Leiter_List = {};
    for i = 1:length(list)
        if(length(list(i).name)>4 && strcmp(list(i).name(end-3:end),'.mat'))
            Leiter_List = [Leiter_List, {list(i).name(1:end-4)}];
        end
    end
    if isempty(Leiter_List)
        Leiter_List = [{'-'}];
    end
end

% Magnet Materialien laden
list = dir('5_Materialien/3_Magnet');
if isempty(list)
    Magnet_List = [{'-'}];
else
    Magnet_List = {};
    for i = 1:length(list)
        if(length(list(i).name)>4 && strcmp(list(i).name(end-3:end),'.mat'))
            Magnet_List = [Magnet_List, {list(i).name(1:end-4)}];
        end
    end
    if isempty(Magnet_List)
        Magnet_List = [{'-'}];
    end
end

% Maschinenausfuehrung
opt.Maschinenausfuehrung = [{'SPMSM'}; {'IPMSM (eingelassen)'}; {'IPMSM (tangential)'}; {'IPMSM (V-Form)'}];

% Schaltung
opt.Schaltung = [{'Stern'}; {'Dreieck'}];

% Spulenform Stator
opt.Spulenform_Stator = [{'Runddraht'}];% {'Formspule- oder Stab'}];

% Spulenform Rotor
opt.Spulenform_Rotor = [{'-'}];

% Nutform Stator
opt.Nutform_Stator = [{'Trapezform (eckig)'}];% {'Trapezform (rund)'}];

% Nutform Rotor
opt.Nutform_Rotor = [{'-'}];

% Kuehlung Stator
opt.Kuehlungsart = [{'Luft (indirekt)'}; {'Wasser (direkt)'}];

% Eisenmaterial Stator
opt.Stator_Eisenmaterial.String = Elektroblech_List;

% Leitermaterial Stator
opt.Stator_Leitermaterial.String = Leiter_List;

% Eisenmaterial Rotor
opt.Rotor_Eisenmaterial.String = Elektroblech_List;

% Leitermaterial Rotor
opt.Rotor_Leitermaterial.String = [{'-'}];

% Magnetmaterial Rotor
opt.Rotor_Magnetmaterial.String = Magnet_List;

% Modus Wicklungsauslegung
opt.Mode_Wicklung = [{'Klassisch'}; {'Optimierung'}; {'Manuell'}];

% Optimierungsziel Wicklung
opt.Wicklungstyp = [{'A'}; {'B'}; {'C'}];
