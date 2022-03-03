function parameter_struct = skjaeveland_pc_handle(model, x, row_names)

pc_input_struct = model.experiment.satfun.pc;
kr_input_struct = model.experiment.satfun.kr;

% handle swc
swc_pc_mask = strcmpi(row_names, 'swc_pc');
swc_kr_mask = strcmpi(row_names, 'swc_kr');
if any(swc_pc_mask) && any(swc_kr_mask)
    parameter_struct.swc_pc = x(swc_pc_mask);
    parameter_struct.swc_kr = x(swc_kr_mask);
elseif any(swc_pc_mask) && not(any(swc_kr_mask))
    parameter_struct.swc_pc = x(swc_pc_mask);
    parameter_struct.swc_kr = x(swc_pc_mask);
elseif not(any(swc_pc_mask)) && any(swc_kr_mask)
    parameter_struct.swc_pc = x(swc_kr_mask);
    parameter_struct.swc_kr = x(swc_kr_mask);
elseif not(any(swc_pc_mask)) && not(any(swc_kr_mask))
    if isfield(pc_input_struct, 'Swc')
        parameter_struct.swc_pc = pc_input_struct.Swc;
    else
        parameter_struct.swc_pc = 0;
    end
    if isfield(kr_input_struct, 'Swc')
        parameter_struct.swc_kr = kr_input_struct.Swc;
    else
        parameter_struct.swc_kr = 0;
    end
end

% handle sor
sor_pc_mask = strcmpi(row_names, 'sor_pc');
sor_kr_mask = strcmpi(row_names, 'sor_kr');
if any(sor_pc_mask) && any(sor_kr_mask)
    parameter_struct.sor_pc = x(sor_pc_mask);
    parameter_struct.sor_kr = x(sor_kr_mask);
elseif any(sor_pc_mask) && not(any(sor_kr_mask))
    parameter_struct.sor_pc = x(sor_pc_mask);
    parameter_struct.sor_kr = x(sor_pc_mask);
elseif not(any(sor_pc_mask)) && any(sor_kr_mask)
    parameter_struct.sor_pc = x(sor_kr_mask);
    parameter_struct.sor_kr = x(sor_kr_mask);
elseif not(any(sor_pc_mask)) && not(any(sor_kr_mask))
    if isfield(pc_input_struct, 'Sor')
        parameter_struct.sor_pc = pc_input_struct.Sor;
    else
        parameter_struct.sor_pc = 0;
    end
    if isfield(kr_input_struct, 'Sor')
        parameter_struct.sor_kr = kr_input_struct.Sor;
    else
        parameter_struct.sor_kr = 0;
    end
end

%handle cwi
cwi_mask = strcmpi(row_names, 'cwi');
if any(cwi_mask)
    parameter_struct.cwi = x(cwi_mask);
else
    if isfield(pc_input_struct, 'cwi')
        parameter_struct.cwi = pc_input_struct.cwi;
    else
        parameter_struct.cwi = 0.005;
    end
end

%handle coi
coi_mask = strcmpi(row_names, 'coi');
if any(coi_mask)
    parameter_struct.coi = x(coi_mask);
else
    if isfield(pc_input_struct, 'coi')
        parameter_struct.coi = pc_input_struct.coi;
    else
        parameter_struct.coi = -0.003;
    end
end

%handle awi
awi_mask = strcmpi(row_names, 'awi');
if any(awi_mask)
    parameter_struct.awi = x(awi_mask);
else
    if isfield(pc_input_struct, 'awi')
        parameter_struct.awi = pc_input_struct.awi;
    else
        parameter_struct.awi = 2;
    end
end

%handle aoi
aoi_mask = strcmpi(row_names, 'aoi');
if any(aoi_mask)
    parameter_struct.aoi = x(aoi_mask);
else
    if isfield(pc_input_struct, 'aoi')
        parameter_struct.aoi = pc_input_struct.aoi;
    else
        parameter_struct.aoi = 2;
    end
end