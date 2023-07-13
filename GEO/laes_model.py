def Laes_model(dybde_modellen,rho_modellen,Lhalf_min,Lhalf_max,fit):
    import numpy as np

    ds_sand = fit[:, 3]
    Lhalf_model = [Lhalf_min]
    rho_model = [rho_modellen[0]]

    zs = np.cumsum(dybde_modellen)  
    for ibound in range(len(zs)):
        Lhalf_model += [zs[ibound], zs[ibound]] 
        rho_model += [rho_modellen[ibound], rho_modellen[ibound + 1]]
    Lhalf_model.append(Lhalf_max)
    rho_model.append(rho_modellen[-1])
    return Lhalf_model,rho_model


