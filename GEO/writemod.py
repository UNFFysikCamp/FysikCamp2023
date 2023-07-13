def writemod(rhos, ds, filnavn, mode='ANA'):
    N_lag = len(rhos)

    # Consistency check
    if len(ds) != N_lag - 1:
        raise ValueError('ds not consistent with rhos')

    fid = open(filnavn, 'wt')

    str1 = mode if len(mode) > 0 else 'ANA'  # ANAlyse, ITErationer, MODel
    navn = 'First test; ACB/BHJ'  # user-defined model identifier
    out = '1 1 1 1'  # Udfiler
    lag = str(N_lag)
    str5 = '-1.'  # not fixed
    str6 = '0.001'  # fixed
    str25 = '1,1'
    ani = [1.0] * len(rhos)  # anisotropy
    dyb = [0] * N_lag

    fid.write(f'{str1}\n{navn}\n{out}\n{lag}\n')

    for i in range(N_lag):
        fid.write(f'{rhos[i]:.2f},{rhos[i]:.2f},-1.\n')  # Resistivitet

    for i in range(N_lag):
        fid.write(f'{ani[i]:.2f},{ani[i]:.2f},-1.\n')  # Anisotropi

    for i in range(N_lag - 1):
        fid.write(f'{ds[i]:.2f},{ds[i]:.2f},-1.\n')  # Tykkelser

    for i in range(1, N_lag):
        dyb[i] = dyb[i - 1] + ds[i - 1]
        fid.write(f'{dyb[i]:.2f},{dyb[i]:.2f},-1.\n')  # Dybder

    fid.write(str25)
    fid.close()
    