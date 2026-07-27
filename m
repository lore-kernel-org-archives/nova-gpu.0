Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8843E2AB7
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147333; cv=fail; b=XV060M+Xio7APwt+AEaWtj02eNGlNnVscOd7tHgCSFVaR4CuBnQp5jcHTNzvbswBQjDh4PqGwcaRG87+gVWMN581Qsk1WRWSPWOyOHRRwytY1XNiFmSiwjLONgGTBgvVPgizXFL2iYxx1HBSQ4GiYNF8Lgt9y/07VOmNBNOOy3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147333; c=relaxed/simple;
	bh=IqrTI293B7ni52E47WoJ91tv2Wgi++XeeWKGs9IQ1XA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oc7mDuC3xT1pDilyL96KUs5JyEDmxeTLC+7zzgIcbGWasKTALLa86/ymsd0fwm6b98s0ErfTOG927acF0LAo/dhvKfy9qSRpOUs5ezctXmD3A85EMjJImKU1JDYi9gaBtgGFNsvo3ngt0OYcfYfvIEl3B8MHJw2T68LaV+NBtM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bDChEKNW; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bDChEKNW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT+yzq6QwQqozLbjk5DG9lNRMQfw6s5XshyzCk+EAQkVlQyBTZUfSkh0de4logTWxjDbazOnPR0ynqKXUX7pZAC7jVdmjjPpHS92kNIjlmzye7oUIfLWLBPMAGw+iEHnX7EQxs+kV2GDzPjave8mDu/ezZaFzZj52GhRc9GTX09YrpS7vQZK1utooPr8S3M1W3GsunNqOHtzl2ibZSKAVVFoYJYW7VwJbsOUfGhwfgLlgfnBeJU57qvv/yn1MpEHvfpMp24CaL95+A3nlM+j8s+bGgzNpvgM1hWv7B4Hy5HBsD6uPEdHNxr3Mbt7lmo0lmGOcMyxRseH+sxpRV7O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC7F1F3xifBBtjVpjJXMopKrgbaBJGvvTZ9UFQeaJHg=;
 b=no2mhflkeOWn2ANvGkca8AHBwM/mD0fMvb2Ls5mHYdFmFRt7pR/jYzX8EkyFn++iUX4bbA+onYHAsifQQQSJPetmZ7Wn9SNe7LiJHzze9CyEuBwbcvWjiQBtYUYs6TUddiZaZT6RakjghLpLJbqoiZl6iqjNIWw4lMpbsCUiUr9TsVUu4H01q7CeF7FtifUpSndMBGky3622ONzfROYw0voCsRe9kfsTLpz4J5XsIZj5aOy9EbsRsOgX1co0218v0HzZIaCbzu1ovF26W3F2bMaOF/iHWLmrRfUzeP9Zz5tfu1WMW6PdcJcPtjQQ0AtoflfdFlnyg7HmiIKo9/ldZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC7F1F3xifBBtjVpjJXMopKrgbaBJGvvTZ9UFQeaJHg=;
 b=bDChEKNWIw2E0NO+CPjBx8m93yw1DkktaFNDnaDYRkutiqtwPPIK5GQIioenvux+cSuDOzw5XL5zOwDkWuXvFn73t/77sktZFTCM1cEyxGQhxrT5BA/y1UKbbJc56RnbfZiZU6BQe8t213n9UgXxGul8eh54CMwMhsJVcxsiItViO8JHUZN5imTTk5y5tapnTU4nnjdDzK2GwLRDZMfztugXrg/qLULRGcHz3FHSNYRlDc6OZ5/UMAkIihUkuhDbjF4gk+XJ/jKaGXyuZ+af7N6Mk5d0404nz0Mty7U8CupG+jjOObOkifa1BUopxltofoMpHAuxUZPf0pPef1canA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:15:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:15:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Jul 2026 19:15:14 +0900
Subject: [PATCH 1/2] rust: add functions and traits for lossless integer
 conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-as_casts-v1-1-6ea704ff25d8@nvidia.com>
References: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
In-Reply-To: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 5329542a-362e-4466-a503-08deebc7fa13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10070799003|18002099003|10067099003|22082099003|56012099006|11063799006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	YRplMfNR3S1Wi2Y6PQYZ0WhJ/lfN7y9ZeZq3m0OJtD+GhKejI1KpmN83OdN9DjOz3hXvp6+gFerj2Z1dPyhkNnjNOpVOZJ7SziOSn7R/M16imV7IHLkilCuo0GGGUQ2z/03alTk09EKM9Q1rrwBnQzy3p4f+J47ypxxHyu9BIxKLg1jmX1O6mcNVrCCBNmr+gtNsJ6VQ4MWdnYAcHOU4j2w1XYiSDnZKAqZuLaPD2x+FOKKBEUitlTeWoYfyaOZE9CUdCHqM49bLF0EgrEsXi1KXLEa2VBALr/9bgdj63kEiK5gL0maVsqvyowFjLUw3l2ez23FySlXrsd62lxQ5TgZYCAn+NlYbXAB0A+MZpVGkJ4E6zYHh9caGlHTBqHKGmldW0nawRw/n5I9vuva8MdzxFqvJ7AV0ZI5Kf4MyO1s8R0xS+dvn3tKdhAuxRkYI1wiRSJljqM0jlKVPngdVvDyUiFnqNsi2NDxgHdW3ABX50C/P3iiN3QB1wm77Q8V7z+lAv87rebzHRp8mCVU9OY1PuzH0HgqWZ1TUXOGfwrLspZj3F5yEHYU6i3AXZ3nc6xbRsa6Mop7MMm0zB2OPptjQt2RBAyTafPG6NHNIb67DToj2jt4sBAt64+KWZ8DwBY1yw8P2hxlFgvDA3Apy3frxwbrPBKVeq/veiFTQ7nItrUjmofwZgfWrs6R1aZPtLq+0dJb/f52sX51N0FVBZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10070799003)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHg2eXFkczhqcWJQZ1VlaXZKOWVuQXdVd0t3eG4rN1IxV3dpUnN4RHloTmJR?=
 =?utf-8?B?NVdFdmpZMUxRWXJGZmVzdmtMMzdkOTBXcG5WWEFjckw5cFBIbi9zQjJaK2FL?=
 =?utf-8?B?SXBzaDdCU1ZDOEE2SFoweWNFWXBZaEhXU3dqdUZMVytTS0RPbFdLUFFXV09Z?=
 =?utf-8?B?ZGF5T0g1cUVxTlg5K1V6alRYdmJFUElyMnQwMnBGZkNmR3k0UUZYVnZQNUR4?=
 =?utf-8?B?ZFFIN29NdlZUVnNmWUhTMGtRRUZHMlVWeWwzSXRIMUZjUWdKQWhzeUQ1WnFX?=
 =?utf-8?B?VEdiaXozak9vclQyT3dPYmtqYldpd1dlbHkrNDhITHJPZld0c1h4NHhLU1Yy?=
 =?utf-8?B?R05NYzJVNHJDQmxxWXM5Y0NjZFZjT2dTdFRjVk83RUJzaHJ4emRFbTFOekVa?=
 =?utf-8?B?anMySzFkcTZLOGh6dVdGSFZHK1l5NGViMWlhNWZ5a29MTWpCemtMd0pxSmEz?=
 =?utf-8?B?T1lRSWVvNmppYWI2QmJrMk9RWk5TQVZpR1Izd1p6NmZMeVRMWnBoSnZSWmc0?=
 =?utf-8?B?U1NmNFNNWlc1Y2FoczdjTE1IQW9iUkQ2cjRNUmhnRklSU3FxcUJZYnNvSVRt?=
 =?utf-8?B?U0dPOTdLVExRdTNWUHhsTkFZYzJpTVFBVE80dDNTOEJDcWhuMU9LODUvM0RL?=
 =?utf-8?B?V3hrQksyazhyaUNNS2xlZldYbG5vaVFva3NxdEYyQy9VVUFCZVpsWm9PWnZt?=
 =?utf-8?B?SkhsNjgyLys2Y3FvdTYzSzNweFJPcWlmNG5COEZ3Mk1mUDhPY09yRUZDOUVJ?=
 =?utf-8?B?QVFjcnpvbjBabFRFZjBBMGpSWlh2YW54dGx4SnhLMkJ0WlllRERQOE1wNnNQ?=
 =?utf-8?B?NGZkTE5EM0ZPL1lQTFNROXZvaGVWa2YzN1pxUXIxRnBGMTZQRUo5cXN5ZjN2?=
 =?utf-8?B?TGtQRXdiRThjc0RHMUVxV0dqN2lsUlRqZzZpYk10UnV1UWFSZFhXUHV1ZFQ5?=
 =?utf-8?B?M3RNVThFOFhGcEFiZlJycGRlQ0Q3dzYwSWtCcWQ1L2Foblg2N1kxK0EzdCtE?=
 =?utf-8?B?L0ZscUdCU1dzOVVzNWd6OHdpTGxvSGhocWJXZGlJZ1d6b3FrTXJjMEtGRmIr?=
 =?utf-8?B?NEpMRTFFaWpjTU5wVUNNN2tYZHlJMTJXaWxqSHFCMFkzaGJuZWJYdTRGUWhi?=
 =?utf-8?B?dmtLbmpsTHVMWUNyWTIzNmRYZmNRdG81ZXkrQWVNYTRyUHVEZ2lUM1lzTlky?=
 =?utf-8?B?ZWthT1JWd1JWNVpEVkxGUmQwK21RRjBZcU1LRUpaUGZtd3I1Z1hVTDVZdytY?=
 =?utf-8?B?MVAvaHV1WU50T3dmcEVuUkpVSmFJeW5WMjZsNm5ScGIvQzN4a3NSeHNVU0pz?=
 =?utf-8?B?VlZnZ0tFTnloMHoyZmtobG8vZW5BUGxJTTFEcW1UT3ZDeUJFSlpoL1pscnZi?=
 =?utf-8?B?UC9uK2NXSVpQai9XaTJZYUFHMXpQVEZDNzBsRkFpMkNKdmd3VmNaVVR6UDlP?=
 =?utf-8?B?cWw2T0F2SHV4TmNTUEpSWmMyc0hqTHdSMUoydzhMbHFoODdrSFhBRm9EVTRu?=
 =?utf-8?B?c3R6TlRoaHAyelZIVUFsT1B3cllIVjNzSSthZzQrU01ydVRLV1gyYllkNm85?=
 =?utf-8?B?UmV4dk1yT3V6eU0xZFloeHkySlQrbE9ZSkRJTXNhdlczcjBMcy80QVdndGxS?=
 =?utf-8?B?V0Qxa2dkTW1MWE9oMDQyRDdQVUZ3NkJoS0VIa0hud1Q3Q2dtZ3pIaDlqenZr?=
 =?utf-8?B?NzQzcmsvYVRRWmpXaFBHWkdDRkgzdHhCZmd4ZDZkUTduSng0M08rRkUyaGJU?=
 =?utf-8?B?enhlVC84cElqZVk4ZjBORGtZNTJqR2JRY0FEUDFwT0o0dzN0bjJoUE5MSDdO?=
 =?utf-8?B?U2IwUzRBV09OY0tLSVF3K2FPU3BjeTRCM2oycUlZOXgyWTFJMkNwVEd1aDda?=
 =?utf-8?B?eEJJek1TbHh6bDFqTXRUcVlhSWlOSjRkajV4OFZWK1JjRTFZN0RSWTVwcEhz?=
 =?utf-8?B?U1Eya3JTOXdwUE16ZHM1UnFMWkh3K2VXSndacGJXbTZESzdERlBuVHBPalho?=
 =?utf-8?B?VTBZVjRJTWdrZnoxYUsvQ1FRSVZFMHRSTmlEZzlCSkh3Ym5vdGhiZlpFSmEv?=
 =?utf-8?B?SlViMnBHQkVHem50WnJKeEZwMFJNaG8xdEw3T1lPR2tPV0xCUGZMMjlmbGRX?=
 =?utf-8?B?ZU9WVU1hQVpPcHl4RWxmeVJuRnJxVVgvd1l5T0RDVEZzaW05N2tHUHdFQm1s?=
 =?utf-8?B?aC9wQVZOREZzYldaWmFBWUlRenZJUFJSSmR4MGJFQVFsZkE3SytmR0dkTjMv?=
 =?utf-8?B?ZEM0UG9Kelo0LzJEYXhiVkhuU09uaDVmb0dUV2s1REY3cFdZSC9ZUVNWNWJH?=
 =?utf-8?B?OWsyTFJZNE1DZVB0RmI3NWtIQUJkMnRZb2ZEOFJrYmtwRWNwd2YxZjFZZFRi?=
 =?utf-8?Q?TQK24UTIJTBi7XaZ6vr9gPKQyzW06hrIx4XomiTtydaZL?=
X-MS-Exchange-AntiSpam-MessageData-1: 1dPrR3kmsuS1zA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5329542a-362e-4466-a503-08deebc7fa13
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:15:26.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vRcPmRXejcxG0za3ZSGyBRjzS3Nm5pfNrICAd1DzgPPT11k7AJncsSyVzE78vzKocd6EJanx+JKY1VRjnxKfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949

The core library's `From` implementations do not cover conversions that
are not portable or future-proof. For instance, even though it is safe
today, `From<usize>` is not implemented for `u64` because of the
possibility of supporting larger-than-64bit architectures in the future.

However, the kernel supports a narrower set of architectures, with a
considerable amount of code that is architecture-specific. This makes it
helpful and desirable to provide more infallible conversions, lest we
need to rely on the `as` keyword and carry the risk of silently losing
data.

Thus, introduce a new module `num::casts` that provides safe const
functions performing more conversions allowed by the build target, as
well as `FromSafeCast` and `IntoSafeCast` traits that are just
extensions of `From` and `Into` to conversions that are known to be
lossless.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num.rs       |   3 +
 rust/kernel/num/casts.rs | 248 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 251 insertions(+)

diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
index 8532b511384c..0788c153916c 100644
--- a/rust/kernel/num.rs
+++ b/rust/kernel/num.rs
@@ -5,7 +5,10 @@
 use core::ops;
 
 pub mod bounded;
+pub mod casts;
+
 pub use bounded::*;
+pub use casts::*;
 
 /// Designates unsigned primitive types.
 pub enum Unsigned {}
diff --git a/rust/kernel/num/casts.rs b/rust/kernel/num/casts.rs
new file mode 100644
index 000000000000..56feda78f0a8
--- /dev/null
+++ b/rust/kernel/num/casts.rs
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Helpers for performing lossless integer casts.
+//!
+//! The `as` keyword can be used to perform casts between integer types, but it unfortunately makes
+//! no distinction between casts that are lossless, and casts from a larger type into a smaller one
+//! that might silently strip data away. Thus, its use in the kernel is discouraged in favor of
+//! [`From`] implementations.
+//!
+//! Conversely, there are casts that are lossless depending on the build architecture (such as
+//! casting [`usize`] to [`u64`] on 32 or 64 bit archs), but not supported by [`From`]
+//! implementations in the standard library because they are not portable. It does however make
+//! sense for the kernel to support these, if only for code that is architecture-specific.
+//!
+//! This module provides ways to perform such conversions safely:
+//!
+//! - A series of const functions (e.g. [`usize_as_u64`]) supporting safe conversions in const
+//!   context. Conversions supported by [`From`] implementations in the standard library are also
+//!   covered as the [`From`] trait cannot be used in const context.
+//! - Two extension traits, [`FromSafeCast`] and [`IntoSafeCast`], providing conversion methods
+//!   similar to [`From`] and [`Into`] for conversions that are safe to perform on the current
+//!   architecture, but not supported by the standard library.
+//! - Another series of const functions (e.g. [`u64_into_u8`]) supporting the conversion of a const
+//!   value from a larger type into a smaller one. This is useful if a constant is available in a
+//!   larger type, but needs to be used as a smaller one that can accommodate its value.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::num::{self, FromSafeCast, IntoSafeCast};
+//!
+//! // Conversion from const context.
+//! const USIZED_CONST: usize = num::u8_as_usize(255u8);
+//!
+//! // Non-const conversions.
+//! let a = u64::from_safe_cast(4096usize);
+//! let b: u64 = 4096usize.into_safe_cast();
+//! ```
+
+use kernel::macros::paste;
+use kernel::prelude::*;
+
+/// Implements safe `as` conversion functions from a given type into a series of target types.
+///
+/// These functions can be used in place of `as`, with the guarantee that they will be lossless.
+macro_rules! impl_safe_as {
+    ($from:ty as { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Losslessly converts a [`",
+                ::core::stringify!($from),
+                "`] into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This conversion is allowed as it is always lossless. Prefer this over the `as`
+            /// keyword to ensure no lossy casts are performed.
+            ///
+            /// This is for use from a `const` context. For non `const` use, prefer the
+            /// [`FromSafeCast`] and [`IntoSafeCast`] traits.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use kernel::num;
+            ///
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_as_",
+                ::core::stringify!($into),
+                "(1",
+                ::core::stringify!($from),
+                "), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            #[inline(always)]
+            pub const fn [<$from _as_ $into>](value: $from) -> $into {
+                ::kernel::static_assert!(size_of::<$into>() >= size_of::<$from>());
+
+                value as $into
+            }
+        }
+        )*
+    };
+}
+
+impl_safe_as!(u8 as { u16, u32, u64, usize });
+impl_safe_as!(u16 as { u32, u64, usize });
+impl_safe_as!(u32 as { u64, usize } );
+// `u64` and `usize` have the same size on 64-bit platforms.
+#[cfg(CONFIG_64BIT)]
+impl_safe_as!(u64 as { usize } );
+
+// A `usize` fits into a `u64` on 32 and 64-bit platforms.
+#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
+impl_safe_as!(usize as { u64 });
+
+// A `usize` fits into a `u32` on 32-bit platforms.
+#[cfg(CONFIG_32BIT)]
+impl_safe_as!(usize as { u32 });
+
+/// Extension trait providing guaranteed lossless cast to `Self` from `T`.
+///
+/// The standard library's `From` implementations do not cover conversions that are not portable or
+/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
+/// [`u64`] because of the possibility of needing to support larger-than-64bit architectures in the
+/// future.
+///
+/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
+/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
+/// destination type is smaller than the source.
+///
+/// Both options are hardly acceptable for the kernel. It is also a much more architecture
+/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
+/// explicitly depending on a specific bus width that could greatly benefit from infallible
+/// conversion operations.
+///
+/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
+/// conversion between types for which such cast is lossless.
+///
+/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
+/// `t as Self` operation is completely lossless.
+///
+/// Prefer this over the `as` keyword to ensure no lossy casts are performed.
+///
+/// If you need to perform a conversion in `const` context, use [`u64_as_usize`], [`u32_as_usize`],
+/// [`usize_as_u64`], etc.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::num::FromSafeCast;
+///
+/// assert_eq!(usize::from_safe_cast(0xf00u32), 0xf00usize);
+/// ```
+pub trait FromSafeCast<T> {
+    /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
+    fn from_safe_cast(value: T) -> Self;
+}
+
+impl FromSafeCast<usize> for u64 {
+    fn from_safe_cast(value: usize) -> Self {
+        usize_as_u64(value)
+    }
+}
+
+#[cfg(CONFIG_32BIT)]
+impl FromSafeCast<usize> for u32 {
+    fn from_safe_cast(value: usize) -> Self {
+        usize_as_u32(value)
+    }
+}
+
+impl FromSafeCast<u32> for usize {
+    fn from_safe_cast(value: u32) -> Self {
+        u32_as_usize(value)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl FromSafeCast<u64> for usize {
+    fn from_safe_cast(value: u64) -> Self {
+        u64_as_usize(value)
+    }
+}
+
+/// Counterpart to the [`FromSafeCast`] trait, i.e. this trait is to [`FromSafeCast`] what [`Into`]
+/// is to [`From`].
+///
+/// See the documentation of [`FromSafeCast`] for the motivation.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::num::IntoSafeCast;
+///
+/// assert_eq!(0xf00usize, 0xf00u32.into_safe_cast());
+/// ```
+pub trait IntoSafeCast<T> {
+    /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
+    fn into_safe_cast(self) -> T;
+}
+
+/// Reverse operation for types implementing [`FromSafeCast`].
+impl<S, T> IntoSafeCast<T> for S
+where
+    T: FromSafeCast<S>,
+{
+    fn into_safe_cast(self) -> T {
+        T::from_safe_cast(self)
+    }
+}
+
+/// Implements lossless conversion of a constant from a larger type into a smaller one.
+macro_rules! impl_const_into {
+    ($from:ty => { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Performs a build-time safe conversion of a [`",
+                ::core::stringify!($from),
+                "`] constant value into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This checks at compile-time that the conversion is lossless, and triggers a build
+            /// error if it isn't.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use kernel::num;
+            ///
+            /// // Succeeds because the value of the source fits into the destination's type.
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_into_",
+                ::core::stringify!($into),
+                "::<1",
+                ::core::stringify!($from),
+                ">(), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            pub const fn [<$from _into_ $into>]<const N: $from>() -> $into {
+                // Make sure that the target type is smaller than the source one.
+                ::kernel::static_assert!($from::BITS >= $into::BITS);
+                // CAST: we statically enforced above that `$from` is larger than `$into`, so the
+                // `as` conversion will be lossless.
+                build_assert!(N >= $into::MIN as $from && N <= $into::MAX as $from);
+
+                N as $into
+            }
+        }
+        )*
+    };
+}
+
+impl_const_into!(usize => { u8, u16, u32 });
+impl_const_into!(u64 => { u8, u16, u32 });
+impl_const_into!(u32 => { u8, u16 });
+impl_const_into!(u16 => { u8 });

-- 
2.55.0

