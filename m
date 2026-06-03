Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C70436367
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471865; cv=fail; b=dGJ3cpjngh/G/DVwXm5aAADpGpvpN35Js2zz6NTbHBweCN8x4ELuNxwnOoEnmdE7idA9hvvFk2BOWi/J9DkhHcvVvjQTXribO1dSJ8ditogwljv1pDzcc/s/tuKTYpK1eWj/ZgMbvfpQjXQuekbKs0EuVxjiI0eJMapY0Y1Q938=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471865; c=relaxed/simple;
	bh=Dylh8N/yz5zegR4nBOERfcPz00JJd7Fbyi/ptgCOcPY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dUQ1fVSwLSYWXI2eo5oAIso2Ghmv9j6bk+gbht2lmkJAPx2wG0yDjlHpzYvjGpIR8yKJrbPhz0ow4MfH97IldNkdp1WAjfFbXzY1qUeKo5czteJ/zfjAJyvQOCOg1F96ey5oJ7cht/orAZPJuh4cTX0AABMweAOnK6shwjyYrH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ucR+yJNf; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ucR+yJNf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCAngzpHrPJNpmpfCXi/IEgjYZtMgM2hiqWlAgxDb8m4mzwwTSi2NNTGpdSP9WUuW35VQ8BOwDMA897V05Sei2dHX6P7KTmUMr6xRBdzRFwwXgIk9P7ntLp07PPFyp+eYo50RGYef00v6rJKxSI3AZc87x65rqfaP2/QPBCuXSdmWR6vSdxgULvQQOpwBejpMgiG8D32kCr62XXbPcPbLHQLZpmCO9pUvqdflK/AtCabaG16xn0E8q8N64Mup4KaaOiyHZ7Us7hQ+ILrVEcQzNYnn9murbbP2/BI8HvfOqAGc+C2YSDBoTjgfopNMs447prNT4S7u7vT//n8E24YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2bQoeSZzJIShubHU/PhYVlgEPz/b3qELSK33EMVqLY=;
 b=bAeSsQ9CdHUEpK7dBXM12KhQxtfZywSUPam98WklsqC85ds7y5vm5TyuLUAcrMY7E3sl+jFppL8Jf5EJ9nW2rBfiz77NASs7s5V6fid48vmPwqj3JHCHPEAD5k7mUAX3YI+FlcQYyYMubHW+tNPVr21pghahGiVEsJpoZBphk2ix4PRwOpyiti4YFT/kh/T6FoDGXCgPsevVpSHSqY5KYBRlePCDpPliq7D1lMo+I5a+OZV9+yxu62iri1YIoLGms3EFHLrM05P0QxkeCLTgVVUz/fNsootTMb6ooZvtQ2Ymsh8mLDKaWdJ0JJs2fxjiRXVzpYp8ORnb2vPimZ5VYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2bQoeSZzJIShubHU/PhYVlgEPz/b3qELSK33EMVqLY=;
 b=ucR+yJNf4uSfx38gr9Gg+81QHJUgbYdp07D08i/1dwEVxJEUWAd9k/bKd+BPtxI4EDrJcQzbeMGVCcpqxra0sbJmvvAZIA/kIBa9K/2BWJuskVIQzV5BAzGy6g5xAPizCo6FoaTSndbqWy+tuLuN1P/PPGlkxO1BGvFeWjhZ6OZfaKIq7G0TIkllSisrGCUGvzEcaAnCBcnnn5QCD1WQH6Amci/4zSRZfGxQM3uVaYytjvxth62VhTHBkIj1FE4pclLGBynDuibqEfD7bFETnlDHkG0T8yp+ZkcobyNxqGtC3Ymf25f8P3QpZGrGV3aAEHWnXsOaVMha2zQvYAEcmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:30:56 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:22 +0900
Subject: [PATCH v13 5/9] gpu: nova-core: Hopper/Blackwell: select FSP Chain
 of Trust version
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-5-d9f3a06939e0@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb6fb1f-9911-44e1-fba8-08dec1420cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LGRKmfzjD09DPJCMv38DExw/Y29BAYr20vILTCMIpS8BI8fV4YE/12LOgm7XbUVOY9nQ8LzqmwRWWJsGbeFEvdRyotjlHd7zd51TvDnKflRqYXxhwHvWuqtoYZcAt3S6h928MHgwZuXsKP486KI5+EnPJ9dzN2hDb9Q7Zt8UU1xXC18njFFK25x6hh/9X88rGzpQBeHdMEwQRldCT8zqfM/h2cTv0Yp4YGXf4ZxHleUwl7VhDETBMmSPfoHU7sjkhX7m9hN+GxR/2SDhhvBP7OeL6U9v+WXxYO8zNAcXyw2bkny2kMuqh7Hg+MigC5e0RapwXi0CREm/7dsqoAXQrGW9PLH/w0xPHR1W4pnC68W3kr/Yd/hRDozkqvCwlNKOZKTEZhF51oZ2vtEr/i2sVdwBELAs8NJKafko832DPXaoGgLsmt4kUlGnl8ev35cUPaWcSahuo99xuovgUBv/y9L0eI5XUUqJud1owjxRV/5Z+r0ie2zLMwIajE81TX4kZNXJ3YAHpkYAsC0B1R4shLKGbqivHAjATdignJgzawd3noD3dqMp9seKf5rG2vHk8SImR/H31etF14ok9ODAhsW5VEhYKIaXTNE0CJRB9siXhfWgdKXeBFXHeivU4uNl8O81ORw013MdB3mvEWzbyFpTwdaC3qxrH9morLkZlzrfzNekb7sQxUPINE/xqUGY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2pYUllPVHk0SHBZVDhlbHE3dzIxSWhXbHZiLzdsZTQzY1Zhd1VpczNwRmd5?=
 =?utf-8?B?WS9SRjZMU0JVSnRIbmNBWVc4MVJnK0JPMDRjWXNjcXpteTdCY1lEbUZQVnNr?=
 =?utf-8?B?TUkveUlXbzhYMVgvdUZxVWdxVUNEMU5tN0JCTkxFcDFIVzdIdG5RMnJOZWl0?=
 =?utf-8?B?eC91SHFaSTI2UFdkYXFKTkQ0V1BOVUlqdm9ac3J6c2RYTlZBRjJKN3FlUGZk?=
 =?utf-8?B?YVNzMnpiNk15WUVhK21lWm9VV0hRaGkwcSt4RHVPOGI2ZTJkNWM5SG1EZk1n?=
 =?utf-8?B?ZlJQVjBXaEdER0FXQllOenlkS0piM0pscEMyTCtlV2FiWi9OdjNsSmlRZC9U?=
 =?utf-8?B?am8zZHZLaVpjUHRWLy9LM2hTRXN5MmJaUm4wbEV6dlorVU1tSDZwU25YRUdL?=
 =?utf-8?B?V2RQb0NVejFmQWE5VmhKc2pCTmZmNFFIa3ltMHhhNE5PaW9UYjBickpTY1pC?=
 =?utf-8?B?eGpSak1WUlBtZXpHdXF2bThtdjlGTjhyWmkxcnJtSHVuWTlBc3lIQXZ4OXlB?=
 =?utf-8?B?cmdKdHU5b3VFc0lqeHpVQjNDZWxyUWhHY081KzdRanVRbWtzcDJpcFZrdmlv?=
 =?utf-8?B?aWJiTUFoNWs1QXl3K2JWK0s2R3ZoMVdnUEZEbDErcGd5OEh3dmo3dCtab3ow?=
 =?utf-8?B?QlcxZ3RjL0hqRk1RdkxHbjl6cnV5SDh6bDBmK0NWb3pKeWZ4cEh3VTNMWDlJ?=
 =?utf-8?B?ODNUYmc0WG1UaU1kMGtraXlEcUprSFFrcC9PUlRMRDZlMVA0YS9OQng1U2VS?=
 =?utf-8?B?ME5RblluMnREV1JiN09XaDlyYnUvazBOUmxUQk0rNDJHMVpQT096OFJaRGd6?=
 =?utf-8?B?WEdLK2svQkJTRDYrR0Y5YlpZUVBubHhuNjVENFpHaEJQbkFVdVZLVFJqM2l0?=
 =?utf-8?B?czVOODV6Y1VWNlp0blNVNkxmQXNIdkpDTlJEaWt0ZXFTTFUrNS9OOXYxbjhZ?=
 =?utf-8?B?bWZUeXMyczdqc04xcmVFSVRFd3NMM1AyZ0tyTW5MNWpTMThDdTNMS0cvci9C?=
 =?utf-8?B?NG1nK2owQXY2aDJGM1VxNC9vSktiN3hYK1l2dHFxNjNBdmE3SFBZaVNsN3Rz?=
 =?utf-8?B?QTc1VXJzOGJ0NFB2ZC84VmVEemFoaVpxMDR1aGtNcW5hSTBYb3dzb1BzclJa?=
 =?utf-8?B?cGJvMkM1bHpxTXBONlR6bWFrd2xmemFzdXVyOWc0ZlhPVnUwU3psOW9xN3U0?=
 =?utf-8?B?Z3Jac1V6TUg1eWREY250OGNFcVVxU2hONytCMy93c2wxK1o4WDFrYjg3eEVS?=
 =?utf-8?B?TjJDMWd3N2FsMHdsb1d6SmtkN29QUFJtcE13VWg0YmVML3EwTVNyWjB1dVpu?=
 =?utf-8?B?U2d5Y1NhVXNkRVJJNU5oTmlsUFdTbVErbnJNRGFVcDlsaGZYSmZnYVRaTjFm?=
 =?utf-8?B?Zy9TNDB1dERiNW9TY1h2djMxQUM0NFBsWFZrSytJQ1pHNHBDMWlncHI3OXJa?=
 =?utf-8?B?UEJXSGJCVnlSVzU0a2h4ZUlnM0FXWm9hWGRwem0vYnJIMGZiQWZRRlo4a0lE?=
 =?utf-8?B?Q2s3Tk4zQUJNK093dGRjWEsyZW5Md3RTQXhidjVZVXdBLzRuSVFWMTZxczM3?=
 =?utf-8?B?OE1nanBOUWZ5ZmdKNXpiajVoUFJFZGROWXJqZnhyTEwvN1dMUzlLOWxEWWRn?=
 =?utf-8?B?NDhRdmlxZW44ejZFd1VxMUtkUysyQUVoYlV0NDltbFZzZ1hPTjZWc3VVRGVx?=
 =?utf-8?B?UlQzMVNmZXo4L1Z1MVU5SzdZMXRPV0VrMnI2cjhYZEIzS1NkenQ0M3lFWWpI?=
 =?utf-8?B?Y3JlTzNNNTltYXcyRnNZbzRtbU44VUxBbkc0WGxXbjNhZm50VDZmYi9zcGtV?=
 =?utf-8?B?RHVnckRQaDBBRFJidzRMZDNTVFRTdSt0Y0xzS3pBMDJ2Q3JUUHRhRjFUNnor?=
 =?utf-8?B?elVYaUtRS1VmYlNLS2Nid1M4a2N4enhGcnBSK1o2Zktjd2NzL2RZMjZOM3BU?=
 =?utf-8?B?MFlVL0o0REN1NG91ZzM5RXhVZWpjOEtsZ2p4SW1mdVZIcXYvSmRlNDJQek9k?=
 =?utf-8?B?dWxNSjZaZWpHbmZHdlZwWHdXQmFRS01QSjdwdndkbmIzK1hDWnEwK1BHRjdB?=
 =?utf-8?B?WEZIUlRqMm9sV3M3TmhZNjdhczJpNjNwQWdBaHZIdjU2WnlxZlRRMDZDNkFz?=
 =?utf-8?B?ZUY0QlBYZXBpVHZ3VFRobHdwT3hydjJnUkJOSDRFVnZYSkhTNzBjbUtjQ3RW?=
 =?utf-8?B?NDRKS2xDK3BGT2tqaDgrOFArSjB6b0hmNEVZVGtsL3c3OW4xeUFuTkgwSXFk?=
 =?utf-8?B?UEliQ2tncVVJTUdzQWtZQkZ2ZFFHMTg5NVJpdVU2dG9FQ2tXWU1pUkJFVGN2?=
 =?utf-8?B?K3RSK01SZFVlTVVabml4N3BjNGlYQ1AxTjdkVEFKR3drcURLZFNZODcwVU44?=
 =?utf-8?Q?YXblef6zWaKHfTBN9xz6eg5s93yiRfWfsZ6+0cXzlzXNY?=
X-MS-Exchange-AntiSpam-MessageData-1: Djc0rEsc0jZbEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb6fb1f-9911-44e1-fba8-08dec1420cb2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:56.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjI9ZS+bSjUwCXBuq03gujdLWW0YV+fp47dPsnE6zG2CHhwBmjii7j4UEQ67NCdENVX4MPKk9Mz010JyWX+jsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

From: John Hubbard <jhubbard@nvidia.com>

The FSP Chain of Trust handshake is versioned: Hopper speaks version 1
and Blackwell speaks version 2. Provide the version through the FSP HAL
so the boot message carries the value FSP expects, and so chipsets that
do not use FSP need not express a version at all.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fsp/hal.rs       |  8 +++++++-
 drivers/gpu/nova-core/fsp/hal/gb100.rs | 23 +++++++++++++++++++++++
 drivers/gpu/nova-core/fsp/hal/gb202.rs |  4 ++++
 drivers/gpu/nova-core/fsp/hal/gh100.rs | 15 ++++++++++++---
 4 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp/hal.rs
index fc5ebb749c59..8aebe1800a64 100644
--- a/drivers/gpu/nova-core/fsp/hal.rs
+++ b/drivers/gpu/nova-core/fsp/hal.rs
@@ -9,19 +9,25 @@
     },
 };
 
+mod gb100;
 mod gb202;
 mod gh100;
 
 pub(super) trait FspHal {
     /// Returns the secure boot status from the architecture-specific `NV_THERM_I2CS_SCRATCH` register.
     fn fsp_boot_status(&self, bar: &Bar0) -> u32;
+
+    /// Returns the FSP Chain of Trust protocol version this chipset advertises.
+    #[expect(dead_code)]
+    fn cot_version(&self) -> u16;
 }
 
 /// Returns the FSP HAL, or `None` if the architecture doesn't support FSP.
 pub(super) fn fsp_hal(chipset: Chipset) -> Option<&'static dyn FspHal> {
     match chipset.arch() {
         Architecture::Turing | Architecture::Ampere | Architecture::Ada => None,
-        Architecture::Hopper | Architecture::BlackwellGB10x => Some(gh100::GH100_HAL),
+        Architecture::Hopper => Some(gh100::GH100_HAL),
+        Architecture::BlackwellGB10x => Some(gb100::GB100_HAL),
         Architecture::BlackwellGB20x => Some(gb202::GB202_HAL),
     }
 }
diff --git a/drivers/gpu/nova-core/fsp/hal/gb100.rs b/drivers/gpu/nova-core/fsp/hal/gb100.rs
new file mode 100644
index 000000000000..d50aaba0a84f
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal/gb100.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::{
+    driver::Bar0,
+    fsp::hal::FspHal, //
+};
+
+struct Gb100;
+
+impl FspHal for Gb100 {
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
+        // GB10x shares Hopper's FSP secure boot status register.
+        super::gh100::fsp_boot_status_gh100(bar)
+    }
+
+    fn cot_version(&self) -> u16 {
+        2
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FspHal = &GB100;
diff --git a/drivers/gpu/nova-core/fsp/hal/gb202.rs b/drivers/gpu/nova-core/fsp/hal/gb202.rs
index 2f08b6c9f308..2bca76c8fd64 100644
--- a/drivers/gpu/nova-core/fsp/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fsp/hal/gb202.rs
@@ -17,6 +17,10 @@ fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
             .fsp_boot_complete()
             .into()
     }
+
+    fn cot_version(&self) -> u16 {
+        2
+    }
 }
 
 const GB202: Gb202 = Gb202;
diff --git a/drivers/gpu/nova-core/fsp/hal/gh100.rs b/drivers/gpu/nova-core/fsp/hal/gh100.rs
index 290fb55a81da..c38a7e96eb60 100644
--- a/drivers/gpu/nova-core/fsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/fsp/hal/gh100.rs
@@ -11,11 +11,20 @@
 
 struct Gh100;
 
+/// Reads the FSP secure boot status from the Hopper/GB10x thermal scratch register.
+pub(super) fn fsp_boot_status_gh100(bar: &Bar0) -> u32 {
+    bar.read(regs::gh100::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
+        .fsp_boot_complete()
+        .into()
+}
+
 impl FspHal for Gh100 {
     fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
-        bar.read(regs::gh100::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
-            .fsp_boot_complete()
-            .into()
+        fsp_boot_status_gh100(bar)
+    }
+
+    fn cot_version(&self) -> u16 {
+        1
     }
 }
 

-- 
2.54.0

