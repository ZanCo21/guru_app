-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Bulan Mei 2023 pada 09.12
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_guru`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_induk_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `no_induk_pegawai`, `nama_lengkap`, `mapel`, `tgl_lahir`, `jenis_kelamin`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, '1122', 'anto', 'indo', '2023-05-03', 'L', 'anto@gmail.com', 'anto', NULL, NULL),
(2, NULL, 'ojan ganteng', NULL, NULL, NULL, 'ojan@gmail.com', '$2y$10$iuDx7QdSUJaUS/E2xuYPa.bu27hNiUKt0f0xS4LrrAo0OVaLlezdC', '2023-05-11 04:59:43', '2023-05-11 04:59:43'),
(4, NULL, 'apa apa', NULL, NULL, NULL, 'apa@gmail.com', '$2y$10$A6W/JZ.49rSQWw4ql8ZlGOwuMDoXHrPc6loqg5UXjnMbxHcsbwnJq', '2023-05-12 05:06:38', '2023-05-12 05:06:38'),
(5, NULL, 'nyoba', NULL, NULL, NULL, 'nyoba@gmail.com', '$2y$10$vWufvXCGOlkfQxvsOmUFBOx4N1F7BfTtiN9xWvS9QawJUigV8VbBC', '2023-05-12 07:43:27', '2023-05-12 07:43:27'),
(6, NULL, 'coba', NULL, NULL, NULL, 'coba@gmail.com', '$2y$10$4Ij5E0TfYswCQZITf12fYOJq7dcy7pHUUdCcOLWPl.PmX32z0/0VK', '2023-05-12 07:54:16', '2023-05-12 07:54:16'),
(8, NULL, 'apacoba', NULL, NULL, NULL, 'apacoba@gmail.com', '$2y$10$uOt0yt2zL9KKfkSi/mqfDOS4IPPxGxnQC8RmOnA6iwbB3C9Zzf.j6', '2023-05-12 07:56:09', '2023-05-12 07:56:09'),
(10, NULL, 'tees', NULL, NULL, NULL, 'ess@gmail.com', '$2y$10$sBJd0kOZw1QIpA3xZt7lfeYaYwLPqjuCLdoyJccAELCWH9NCUO9m6', '2023-05-12 08:00:07', '2023-05-12 08:00:07'),
(11, NULL, 'fauzan', NULL, NULL, NULL, 'fauzan@gmail.com', '$2y$10$1mOW3kZbAAkPSnAa5DRUEO1G/OGfZ2D6K2E3VbT.V5gq60b6Ydi7C', '2023-05-12 08:38:03', '2023-05-12 08:38:03'),
(12, NULL, 'yaelah', NULL, NULL, NULL, 'yaelah@gmail.com', '$2y$10$WX/oFKiKNBZ3OsFUaSq93ezinrzL7xrsVtkws0DrMrao6SnhovGs2', '2023-05-12 08:56:26', '2023-05-12 08:56:26'),
(13, NULL, 'astaga', NULL, NULL, NULL, 'astaga@gmail.com', '$2y$10$XyuaFPEIix0kcCDGWul2POup4fVMratGlmGNG72apm9b5pQHTc8D2', '2023-05-12 09:42:36', '2023-05-12 09:42:36'),
(14, NULL, 'okta', NULL, NULL, NULL, 'okta@gmail.com', '$2y$10$WLV0kt4xhzJ0JG6XPmbIYOU2M8v2YXx66Xix6v/Rt9R/TohbVxnqy', '2023-05-12 23:32:09', '2023-05-12 23:32:09'),
(15, NULL, 'mahes', NULL, NULL, NULL, 'mahesa@gmail.com', '$2y$10$xEqfTktlypAunoJsrk6v2eJAojK.oLG45SdsfxTtGaKnjz4DsycFW', '2023-05-12 23:56:07', '2023-05-12 23:56:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_11_075545_create_guru_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(25, 'App\\Models\\Guru', 15, 'Personal Access Token', '4f841b01f0b6f8b30f77e09cf8fa2f9c95a349499835e6e706d640e3180b09c0', '[\"*\"]', NULL, NULL, '2023-05-12 23:56:31', '2023-05-12 23:56:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guru_email_unique` (`email`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
