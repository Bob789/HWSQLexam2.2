-- Query to create rable
CREATE TABLE tv_store (
    id SERIAL PRIMARY KEY,
    number_catalog VARCHAR(20) NOT NULL UNIQUE,
    brand VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    size_screen INT NOT NULL,
    resolution VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity_stock INT NOT NULL,
    year_release INT NOT NULL,
    tv_smart BOOLEAN NOT NULL DEFAULT TRUE,
    Os VARCHAR(20) NOT NULL,
    panel_type VARCHAR(20) NOT NULL,
    CONSTRAINT chk_os CHECK (Os IN ('Tizen', 'WebOS', 'Android TV', 'Roku', 'Fire OS', 'Google TV', 'None'))
);

INSERT INTO tv_store (number_catalog, brand, model, size_screen, resolution, price, quantity_stock, year_release, tv_smart, Os, panel_type)
VALUES
('TV-8614', 'Philips', 'V-Series', 43, '8K', 3903, 46, 2024, FALSE, 'None', 'OLED'),
('TV-5447', 'Panasonic', 'X90J', 43, '4K', 2546, 35, 2021, TRUE, 'Roku', 'QLED'),
('TV-5432', 'Samsung', 'U8G', 32, 'Full HD', 2372, 32, 2024, TRUE, 'Google TV', 'OLED');

INSERT INTO tv_store (number_catalog, brand, model, size_screen, resolution, price, quantity_stock, year_release, tv_smart, Os, panel_type)
VALUES
('TV-6577', 'TCL', 'U8G', 65, '4K', 4889, 47, 2023, FALSE, 'Fire OS', 'OLED'),
('TV-1955', 'Vizio', 'PUS8506', 75, '4K', 3808, 44, 2022, TRUE, 'Google TV', 'MicroLED'),
('TV-5693', 'Toshiba', 'X90J', 43, '8K', 1067, 7, 2021, FALSE, 'Tizen', 'LED');

INSERT INTO tv_store (number_catalog, brand, model, size_screen, resolution, price, quantity_stock, year_release, tv_smart, Os, panel_type)
VALUES
('TV-4034', 'Philips', 'HX800', 55, 'HD', 4795, 14, 2019, FALSE, 'None', 'QLED'),
('TV-3090', 'Panasonic', 'X90J', 32, 'Full HD', 4547, 17, 2020, TRUE, 'Roku', 'QLED'),
('TV-5920', 'LG', 'X90J', 32, 'HD', 4337, 33, 2019, TRUE, 'Roku', 'MicroLED'),
('TV-8700', 'Vizio', 'PUS8506', 55, '4K', 2363, 5, 2020, FALSE, 'Android TV', 'OLED');