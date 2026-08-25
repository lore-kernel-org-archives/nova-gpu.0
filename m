Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6381330D35
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625907; cv=fail; b=fU/r5bKs9ZzwveK1b6Xi6JYBgbVMZsuQQ4jZQHxwcix0avQ3MkaYYVKDsiAqBiaLJIh/egjtQLz2Go1bTvWiY2Zxnkp3ERwL3idQRm4NtnauWgaZY/BRIzYJI5wh7M5xFobCRkdQSUxF/kpk6nRJwsHY7G8BXQ0s36dVZtB3HSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625907; c=relaxed/simple;
	bh=htXf4QrO/2dKcsAy6GfT3pE5lO6FDnqPE18161Bt134=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iZyAknQ0bcFhw20ncjNH76ZInyqWS5Qilwq6AEShrJJYBralFCiN/hSSLe+TseQ9FgqCtN6QwGUHq/RpcDlFgbS7uOFPzgsC2UT/ZIP/mfrdRyOHXznLiSuYkGsD8s4saIZLxB3Li4wutopd+EcCw3qVkkxdVY+HcH6WqC4eiYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RTQ0PYz0; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RTQ0PYz0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeQ/F2cv9ga3iQcC/i1+ZiepODjxnRh/F44gy+5P5QLuCZOvwuG0lfgUfcU+Rh1wXxjq6vqc5Jnwfw3/L+GRF3eTab4NFT8Agkdht9I/SZittO09smT/fo9xCkvRQaovqYKMJAsPHRvIn7TxCVwb2XGQ4uJ1ES2h1YAw2v319n746cvUsfey1xxUlG8nhWBNRwCKJ+HW4Hf4toll8NpubhV4CvnSYQYwjcs17oK4Yj51aL3BIF5v3qlD9gxZM0TWPGFvGL48XAkCA/F+DHXx0lhqVRG4GJ016KtokhZtT0F0YvC5tE3lBqHbccG/tMurkYz1ZWHV2hG7y5WqW0u+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SADMSWfv1CCc9jgyaE5uDLLMAVaCA06vVIt6KJz26T4=;
 b=DwmuCT2+xtS6opKRRM+zaf+aS3KQzH7z/ISS/m7y0aQGQZ9fgtxNJD0yTbGIMcvI8E3Iat5zXlGhFUCifLjhplg6tI13sNqXatt6+n+ODSFx+90a1zfEjshEmJSmaqTbsU0K5BBu7xgMkgM+EjGKE0nfMXyXO8BmX4wUmgi0triBkYI+lpwX8WTI4WA1zYlYc0gvUhQHc5evPJ7Ij1pxCmUS2MXyZQlXAV/5iuFftjG+L1I2po3UOneISLRvDSPxallRypETTMuNRAu/Ic4TcqP5nCvVptAIsBSImrHoh52r1r60TJ+fQyXDqVkt0jIvGH++zD4lusCIvs8VbbMVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SADMSWfv1CCc9jgyaE5uDLLMAVaCA06vVIt6KJz26T4=;
 b=RTQ0PYz0ZaE9SnsOqzRJS/Y56D5Dowa7+QoXJnrhM60k9fvhAl0eDJkaVyo1nsTJs7P6ZzjuVfI4ylgJndMcJal4bzAxdt0qPtLGcRE2GDaevcSeDtOyzOxyfwj5qU/uvE4IIXO0aEu4LxV3/dcXGpIMN29OnPD3zSgnD80mpZFqF9tQesRSuZnm41QAdy7Ibc4GlP1ZuyiCXo3dJy884Y043d9H4m/WMLe612Vpa4w/Q6ppMIgZP68D8jf5V5hCX5JP9PtmHTP4UuYaFm2ZGMCqu+DRx9GcYJJFOuwXccVGjnFRq9NXt7hP0H1QxWi14GQmMVi+5euKEfjxir1s8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 02:44:57 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 02:44:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 25 Aug 2026 11:44:47 +0900
Subject: [PATCH 1/2] rust: num: casts: replace const type narrowing methods
 with a macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nova-gpu@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba58000-e8ca-48f8-4594-08df0252d979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|1800799024|366016|921020|6133799003|56012099006|10067099003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XkKEEyvuqMYTDq4AANfUCS7YLGOLV42ZggpDstaxA9teo99KoB/gZvy0W8nakJ+k/DoDTAQPDXKu0KaGVPEQc0zhoVuNf0PkClQYZvyjr8d7zVn2xwG0W1tHTwm5N1yo+AMIkvZVdRQhVKvyCWhrd/0CPOjYyprq/xCUWEX422tJ8PubDFW9dTEFqqaqr4tkmDHi8i1auHSELQn0pPgGAYa7/hRvZvVb12EM9rk7hkzk1r48oOn1mtOziPlYLRrhvqvL/yigEF9JrptesoMribxp505/VZjAZWw4AnoFFa5TdNYzrrxR8bLrxrxFsvmbFb8m8dsVBmAG+SP6n58Cnukq/wCxYcxPdcfj/A/pSy+d12c93Pt6F7tlvsPGvkLnBNI4fVzeWmKbpEEjBninC7K0MI5d2zkGmc6sIbH7TbwZND4YZpmgggT/H1k2zk/toEk6NMD/myKk0a4kg3G+F8QzYj/rJT5NoRHDSQdPF4UBsJx8/EE+P9l/kz8qZziL8NQBj3MntCG8DYEhuqHIKLE/6phOm8Wi75a+Ia3VF7g0gZxZyBSkaN5WsrFl1cFfiHGFm+yQFvgOWNbo0Ll5qkB73xicLTZ0CewOh9/1+Fx51rLH2JXqTneomtoDaQSQR+WWFEkkcmo0jIOSSPnekcfqPl0FUfbJiuVWf5C8Rj4fhT/vH9aJeGvdSiQmrZrqva++5NVPVzv8PHsv+K9Xuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L016aHkrdU9TUWRZTGR1Uy9FaTlVVTQwaVBKNk1RNnY2UXovcEUrT2RGYVlQ?=
 =?utf-8?B?ZjlGRHJ3TGRadi9kcUVEaUw5QTN2Q0lvQ3RXOWdIQ3pDTHZEYUZkNE5JQUto?=
 =?utf-8?B?eEdsazJtNmg2WXZlYitoWlBuM1YrdG55c08rMnRNd2VaL1dXUmNlRnR1Z2Iy?=
 =?utf-8?B?Z3lIZlBVNm44Mk9NamVuSGFiMzFhM0FTNWxsL2lhRFluVTNub2paNFh0OWx0?=
 =?utf-8?B?MHRqQVVkcXVhb2xTRE95Zm1lR1dSeDN3SFhpL09MVHZsNWlJWFJSQWhNNFQ2?=
 =?utf-8?B?WklraERXclQ0dHYvSHdnbkNSc1ZFQ3Jva1RuNk1VSU5uT2RmVmRyaGRXbHdr?=
 =?utf-8?B?MEczbGVZRnlRNUdhMHlqSkpIQ2U4clREQnM3STFSSTFMQzJJYUhWVFpGditu?=
 =?utf-8?B?ekJnQVg0QVpkRndMdEZ1cVUxMGJZR245dFVHa3RFcDkxM2thRm5SU1BhdnU4?=
 =?utf-8?B?QTJ3RUNtd2pJOGFmcHZadTllU3dCNHhHbk5TS0hWTzh3ZUYwYmtLeFIrS0xh?=
 =?utf-8?B?d2lSMVNxNWlFU1RjMXo1N0l1UHQvMEptTFBLcDhncENmQjVtdXRyeVlMWWRP?=
 =?utf-8?B?d2xvVW9DRTZvZ2JobjhyU1VPekNLblQwZ01NRlMrdzBwbG9xVjl5TWxiT1B0?=
 =?utf-8?B?cnZBRHBtc1hJZWswdkcxY3lCVDZTVk1oZzdaVHVDOXQ3Mm5MVzErSWZEOCtr?=
 =?utf-8?B?TjJFRkR3MTM4dUxFanJrMzgvUTJ1REZZN296dUoyV0JYM2dkVTZobTMxY1Nt?=
 =?utf-8?B?THpreE5xa1lPYjVZN3Y1dG1xc0dxSk85WUd1TjlLcnJQMkgvbk44QTc4N3BI?=
 =?utf-8?B?VmF0TTdBdE0za0g1UWRaN09xWEJlNzNTd1U4dTM0b1AvaXFLVGJTNXExc0Ny?=
 =?utf-8?B?S0tOakJKOUtUM2lYandEZllYMmZEL1dHWXQwUDNiZDNrSEpEdlg0b3Y4RWYr?=
 =?utf-8?B?R1hPdklNYzMycDRSaEk0aUViZzVnb21vOXM3N2dERlJaQ1NkZDVHcVRUV3hm?=
 =?utf-8?B?bnc5RGJRUlZKb2IzZDgwRWMwQVNlWWNRSUVITVh4cXErcDhzMFl1bXkxaXk1?=
 =?utf-8?B?elowMENGZmdOT1AzUzBaSWVkMU1HdEZ4c3RkaUIxenBpOWZTOEF3QzlVS1d6?=
 =?utf-8?B?ZEw5Z2FkZ0lDenFkSm1pUHc5RFNyMHQyM0h4WHc5aGRqd3hvRi9uT3k1YTRR?=
 =?utf-8?B?S0FQakUyZ0VsQlkreFIvZENUUkM5QlVRTHRMdlVmQ2luWVdpSEFLWW5xMWRX?=
 =?utf-8?B?QkdGVjVBdlpsSDFYK0dmMG1PZmxvbnh2Z0haYnIxeEVieFNhTTB5UjRmcTNO?=
 =?utf-8?B?ajNMamVLR05BblVwZkYxQ1BwOENKcEhlcWVMWjJBWDQyR3JGaytraU5hQ0pp?=
 =?utf-8?B?dlcxc1pCZTEycXpyK3VJK2lBTjNrYzJKM1BScnpYVmlpcjlsbjFJdmJpTHVU?=
 =?utf-8?B?dkg0VWoyUUhjRWlhckhQUXFjU1dZMFpsY2tENTNxbldIMXphRG9DSzNVSGQ5?=
 =?utf-8?B?UXlUOUQ5aVlMS3cyZThRNTBLejM3M2k0TzZXVnArUHdqRXlOZmR5a0taU1dx?=
 =?utf-8?B?T1YzaXVCTXQ4bE5PRFRONkxhcUJCQWdrRjBZbklRTVJFblJEZUpuWkpoMkpl?=
 =?utf-8?B?WmNYdzIvcGIzMVg1V2l1cDRPV0wvbjI4TnpGRTlOdmphU0QwSnl5aTh0WXVV?=
 =?utf-8?B?Kzg0NDBFQ096aG43U1FnVTJRdElqY3ppREJnV05MbzhvZkE0cHYwc0pDVVhj?=
 =?utf-8?B?dExSWEVLaFlZbzE4S3ZUR2lZayt6cGUvRnJwOGg4NVlEWXpBZENDeXpMazk5?=
 =?utf-8?B?bjBuT2tTanBYVTlSRXBOMHdhSlZlTjlCc0d6amY0MUlDRExPK1o5WU15NkRu?=
 =?utf-8?B?c2dZUXZ0Rmo4UHo3WWExbmhUZ1BHVGU1YVV0bk1jbXJ0RWFsb3FLckxkY0pl?=
 =?utf-8?B?b1RSL3JQaThPSkJPVTBJNFFlcUZ2Z2I4TzBQVkJnL2NFUE9MTXgvOWNTYy80?=
 =?utf-8?B?VTZ1QnNRdHhIcEI3WlYzL1hEYnAwNjFzSFBKY3JxSFlwRFRKSERoY3pXaHh0?=
 =?utf-8?B?aDlTV2xXcmtBNzU0MzhNTmk0N3JjQytYKzhxL1ZKM2VQMERYZFZsWXFXOXR2?=
 =?utf-8?B?MnhBWmdYTXh2TjhkODlyQ1NXVkwxTHZVemROZXlPcE1wWWpCdmMxOWhaeTZU?=
 =?utf-8?B?VmdreWhEdGZQL2tBWjJGM3dTcUJ5UXBkcy92a0UzTEUzWHJ4dk15aklXTnhn?=
 =?utf-8?B?bFBkVzI0QUU0UlRPQmg3R2x6TkRCcnN0d25tTlBxK09JTWFrRm1Ld0w4RGM2?=
 =?utf-8?B?MytQQ3E2bmFrbm1HNFFPWHpoV2RrbXdkUThIYi8rZEZYMzQvK1hUVThhZXoy?=
 =?utf-8?Q?28mF4NOnhKhlV8fM239m7JGac6ik1HrKd8AGkXcji+iQV?=
X-MS-Exchange-AntiSpam-MessageData-1: oKsYRYuewBB7Ew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba58000-e8ca-48f8-4594-08df0252d979
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 02:44:57.2593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgXNaNRoMDUDbUPNSanWm51bxRlq4/pHe4MAwwiF7plw82Cbv+ja5fKMMMoyQVLD5/omxk+xmx4oJ10vMgOzDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094

The casts module features a series of const converters (e.g.
`u32_into_u16`) that narrow the type of a const expression provided that
its value can be proven to fit into the destination type at
compile-time.

These functions are numerous (9 of them), generated by a macro and thus
not easily discoverable, and cumbersome to use as they require a
turbofish and const expression between `{` and `}` braces.

Replace them all by a single `const_as!` macro that expands to a const
block verifying the lossless nature of the conversion at compile-time.
This turns e.g.:

    const DMA_LEN: u32 = casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();

into

    const DMA_LEN: u32 = casts::const_as!(MEM_BLOCK_ALIGNMENT => u32);

This makes things easier to read and understand, while shifting the
burden of checking the conversion's validity from reviewers (via a CAST
comment) to the compiler.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/casts.rs | 129 +++++++++++++++++++++++++++++------------------
 1 file changed, 79 insertions(+), 50 deletions(-)

diff --git a/rust/kernel/num/casts.rs b/rust/kernel/num/casts.rs
index 7e6c7dec747d..a4a18a6f2ba8 100644
--- a/rust/kernel/num/casts.rs
+++ b/rust/kernel/num/casts.rs
@@ -20,10 +20,8 @@
 //! - Two extension traits, [`FromSafeCast`] and [`IntoSafeCast`], providing conversion methods
 //!   similar to [`From`] and [`Into`] for conversions that are safe to perform in the kernel, but
 //!   not supported by the standard library.
-//! - Another series of const functions (e.g. [`u64_into_u8`]) supporting the conversion of a const
-//!   value from a larger type into a smaller one, provided the value fits into the destination
-//!   type. This is useful if a constant is defined as a larger type, but needs to be used as a
-//!   smaller one.
+//! - A [`const_as!`] macro, losslessly casting a constant expression between any two integer
+//!   types, with conversions that would alter the value reported as build errors.
 //! - An [`arch`] sub-module, defining more conversion functions that are only guaranteed to be
 //!   lossless for a given pointer size. These can only be used in code that is specific to a
 //!   given pointer size.
@@ -36,6 +34,9 @@
 //! // Conversion from const context.
 //! const USIZED_CONST: usize = casts::u8_as_usize(255u8);
 //!
+//! // Build-time checked narrowing conversion of a constant expression.
+//! const NARROWED_CONST: u16 = casts::const_as!(0xf00u32 => u16);
+//!
 //! // Non-const conversions.
 //! let a = u64::from_safe_cast(4096usize);
 //! let b: u64 = 4096usize.into_safe_cast();
@@ -182,57 +183,85 @@ fn into_safe_cast(self) -> T {
     }
 }
 
-/// Implements lossless conversion of a constant from a larger type into a smaller one.
-macro_rules! impl_const_into {
-    ($from:ty => { $($into:ty),* }) => {
-        $(
-        $crate::macros::paste! {
-            #[doc = ::core::concat!(
-                "Performs a build-time safe conversion of a [`",
-                ::core::stringify!($from),
-                "`] constant value into a [`",
-                ::core::stringify!($into),
-                "`].")]
-            ///
-            /// This checks at compile-time that the conversion is lossless, and triggers a build
-            /// error if it isn't.
-            ///
-            /// # Examples
-            ///
-            /// ```
-            /// use kernel::num::casts;
-            ///
-            /// // Succeeds because the value of the source fits into the destination's type.
-            #[doc = ::core::concat!(
-                "assert_eq!(casts::",
-                ::core::stringify!($from),
-                "_into_",
-                ::core::stringify!($into),
-                "::<1",
-                ::core::stringify!($from),
-                ">(), 1",
-                ::core::stringify!($into),
-                ");")]
-            /// ```
-            #[inline]
-            pub const fn [<$from _into_ $into>]<const N: $from>() -> $into {
-                // Make sure that the target type is smaller than the source one.
-                $crate::static_assert!($from::BITS >= $into::BITS);
-                // CAST: we statically enforced above that `$from` is larger than `$into`, so the
-                // `as` conversion will be lossless.
-                $crate::const_assert!(N >= $into::MIN as $from && N <= $into::MAX as $from);
+/// Losslessly casts a constant expression into a target integer type, or fails the build.
+///
+/// This is a checked replacement for the `as` keyword on constant expressions: the conversion is
+/// evaluated at build time, and a build error is triggered if the source value does not fit into
+/// the destination type. Since the compiler verifies that the conversion is lossless, a `CAST`
+/// comment is not needed.
+///
+/// The argument is a constant expression.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::num::casts;
+///
+/// // Narrows the type of a constant in const context.
+/// const CAP_ID: u16 = casts::const_as!(0x0010u32 => u16);
+/// assert_eq!(CAP_ID, 0x0010u16);
+///
+/// // Widens the type of a constant, outside of const context.
+/// let v: u64 = casts::const_as!(42u16 => u64);
+/// assert_eq!(v, 42u64);
+///
+/// // Signed conversions work as well...
+/// assert_eq!(casts::const_as!(-42i32 => i16), -42i16);
+///
+/// // ...and so do cross-signedness conversions as long as the value fits.
+/// assert_eq!(casts::const_as!(258i32 => u16), 258u16);
+/// ```
+///
+/// A value that does not fit into the destination type fails to build:
+///
+/// ```ignore,compile_fail
+/// # use kernel::num::casts;
+/// // Fails to build: `0x10000` does not fit into a `u16`.
+/// const ID: u16 = casts::const_as!(0x10000u32 => u16);
+/// ```
+///
+/// Conversions that alter the value also fail to build:
+///
+/// ```ignore,compile_fail
+/// # use kernel::num::casts;
+/// // Fails to build: `-1i64 as u64` yields `u64::MAX`.
+/// const V: u64 = casts::const_as!(-1i64 => u64);
+/// ```
+///
+/// Runtime values are rejected:
+///
+/// ```ignore,compile_fail
+/// # use kernel::num::casts;
+/// fn f(v: u32) -> u16 {
+///     // Fails to build: `v` is not a constant expression.
+///     casts::const_as!(v => u16)
+/// }
+/// ```
+#[macro_export]
+#[doc(hidden)]
+macro_rules! const_as {
+    ($v:expr => $into:ty) => {
+        const {
+            #[allow(unused_comparisons, unused_assignments, clippy::as_underscore)]
+            {
+                let v = $v;
+                let r = v as $into;
+                // Pin `back` to `v`'s type so `as _` casts back to the source type.
+                let mut back = v;
+                back = r as _;
 
-                N as $into
+                ::core::assert!(
+                    back == v && (v < 0) == (r < 0),
+                    "value does not fit into the target type"
+                );
+
+                r
             }
         }
-        )*
     };
 }
-
-impl_const_into!(usize => { u8, u16, u32 });
-impl_const_into!(u64 => { u8, u16, u32 });
-impl_const_into!(u32 => { u8, u16 });
-impl_const_into!(u16 => { u8 });
+#[doc(inline)]
+pub use const_as;
 
 /// Conversions that are only lossless for the current architecture.
 ///

-- 
2.55.0

