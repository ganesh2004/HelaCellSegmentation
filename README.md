# Automated HeLa Cell and Nucleus Segmentation using Image Processing and Deep Learning

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Authors:** Mukunda Hosangadi, Sumedh Kudale, Ganesh

_This project was developed as part of our Digital Image Processing (DIP) course._

## Description

This repository provides code for automated segmentation of HeLa cells and their nuclei from Serial Block-Face Scanning Electron Microscopy (SBF-SEM) images, using a hybrid approach combining MATLAB image processing and Python-based Deep Learning (U-Net).

## Methodology

1.  **Preprocessing (MATLAB):** `cell_segmentation/BWsave.m` enhances raw images for U-Net input.
2.  **Cell Segmentation (Python):** `cell_segmentation/Cell_segmentation.ipynb` trains a U-Net model to segment cell bodies.
3.  **Nucleus Segmentation (MATLAB):** `nucleus_segmentation/nucrun.m` uses image processing on original images and cell masks to segment nuclei.

## Dataset

The project uses a 300-image SBF-SEM stack. The original data and ground truth masks are required (see Karabağ et al., 2020, PLoS ONE). Place original images (1.png - 300.png) in `ROI_1656-6756-329/`.

## Repository Structure

- `cell_segmentation/`: Contains preprocessing and U-Net training/evaluation code.
- `nucleus_segmentation/`: Contains nucleus segmentation MATLAB code.
- `cell_segmentation_results/`: (Output) Cell masks from U-Net.
- `nucleus_segmentation_results/`: (Output) Nucleus masks from MATLAB pipeline.
- `Research Paper.pdf`: Detailed analysis and results.
- `LICENSE`: MIT License.
- `README.md`: This file.

## Requirements

- **MATLAB:** R2022b or similar, with Image Processing Toolbox (v24.2+ recommended).
- **Python 3.x:** TensorFlow/Keras, NumPy, OpenCV, Matplotlib, Albumentations, Scikit-learn, Pandas, Jupyter.
  ```bash
  pip install tensorflow numpy opencv-python matplotlib albumentations scikit-learn pandas jupyterlab
  ```

## Usage

1.  **Setup:** Clone repo, install dependencies, place original images in `ROI_1656-6756-329/` and ground truths where needed by Python scripts.
2.  **Preprocess:** Run `cell_segmentation/BWsave.m` in MATLAB. Creates `BW/` folder with processed images.
3.  **Train U-Net:** Run `cell_segmentation/Cell_segmentation.ipynb`. **Modify paths** inside the notebook for input (`BW/`) and ground truth data. Generates model weights.
4.  **Predict Cells (Optional but needed for Nucleus Seg):** Run `cell_segmentation/Evaluation.ipynb` (modify paths) or adapt training script to save predictions into `cell_segmentation_results/`.
5.  **Segment Nuclei:** Run `nucleus_segmentation/nucrun.m` in MATLAB. **Modify paths** inside the script to point to `ROI_1656-6756-329/` and `cell_segmentation_results/`. Saves results in `nucleus_segmentation/nucleus segmentation/`.

## Results Summary

- **Cell Segmentation (U-Net):** Mean Dice Score = 0.9781
- **Nucleus Segmentation (IP):** Mean Dice Score = 0.9215

Refer to `Research Paper.pdf` for detailed results.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
