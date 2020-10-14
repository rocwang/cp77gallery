export const path = (target: string, size: number) =>
  `/all_goodies/${target}.${size}.webp`;

export const srcsetByDensity = (target: string, sizes: number[]) =>
  sizes.map((size: number) => `${path(target, size)} ${size / 200}x`).join(",");

export const srcsetByWidth = (target: string, sizes: number[]) =>
  sizes.map((size: number) => `${path(target, size)} ${size}w`).join(",");
