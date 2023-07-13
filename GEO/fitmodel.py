def fitmodel(path):
    import numpy as np
    import os
    os.chdir(path)
    # slmatlab
    os.rename("SLMATLAB.M", "slmatlab.m_bad")
    os.rename("slmatlab.m_bad", "slmatlab.m")

    slmatlab_file_path = 'slmatlab.m'  # Replace with the actual file path of "slmatlab.m"
    txt_file_path = 'slmatlab.txt'  # Specify the desired output text file path

    with open(slmatlab_file_path, 'r') as slmatlab_file:
        slmatlab_contents = slmatlab_file.read()

    with open(txt_file_path, 'w') as txt_file:
        txt_file.write(slmatlab_contents)

    fit = np.genfromtxt('slmatlab.txt',skip_header=2,skip_footer=1)
    return fit

    
