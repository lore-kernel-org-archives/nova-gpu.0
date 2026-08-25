Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011002.outbound.protection.outlook.com [52.101.57.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850603E3164
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646698; cv=fail; b=VPspyMuy4RJiLzJNC5XxwaTYFVm+Usrh+NMsDrGsXnOiZhlQwqHVqA1QGYDWgUtQj2Nll3gjPlC6t7LpH9rHPjjSfML3Iti3vPp5nY/PFJtc1Z+K2bTBKtum1b0a+7gnTI4IeivalgXo/3NEyviPoCYcX/gSasI+mAGnmxE8keA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646698; c=relaxed/simple;
	bh=wgmu7mRbgherU0Tp/H621N9eKz9DRI5a/03G5VXVHiU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=bdHcIEVW5wBwdNurAaPJSLmZ1nHJ/IZ3ZL2CFeZ93yVp5NYkI88KHD4tCAV6KuaHbYbWCYVyjQOrEc6/UT8CyNR0Ypw0UKDbpiEd8lnAhpnla0maQCXMfnp128XW/Wod61xqomxh1fP4H+90LqtnvfpSAKx3jfK6N+rgqmIcmIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AQcJv9on; arc=fail smtp.client-ip=52.101.57.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQcJv9on"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xN0aesfRI+eD3urxHgjwnW5HC02BmJdJA4y4kgvyMk3jkTdG7A7wi7yf4h3V8EMTQCAQ/TBfAjUDVkyZamzO9jPKfEIxRQ4+EeZa1UEaWLOcsXMHGhJfFcrNZs3/FJRRc71GwYw/pOqyRJJGsVyVUXAI1DS3DUftJUMHZWdMnOedgbpKRcyMv/hrHA7s4z0LS2GO+NdCRdUAJChIqBVxKApEi4Vd18mKgaU47xqgKEB4lT/vkEk+IwwTb1r48j64hvP954Tt40GSylelFigtLJK8i4cawbYr4ya0ylGJOxD51BewHhSJ3UiyRKzxFC6eSnMFXVEJUbKg1HIjsi+TFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xudmM+jCbqI1mUy3ER2wCa7Pg592HDwdTucH41x+uk=;
 b=GrIGXb748iKNKAIrhneBkm4C2KeCYOPoPmjQcQbOQlhgV6s8aGTdhok8Xc+JW8OX6zw9KL6WJTPhGo+qilFDIMS3w5vxOot4PjFu04XQdGL/dPIsPc6cfbT5X1QTJ4xhWVm/bTT9+rYwgtEUycOXTQzlK2x8X53iedZDMnPG8BepjAKp4t6kTg/aOpe4yifxpT5VEt585/XGzrx4pjhFLlGEok5gv5x1SnYQ/pmBf7e/naLb4dHF6gji5EkpPZy4iSIBQhQE/cWaGQm1rMLwuf58Mw4DhcK7N6jRjqTTJ41JuUKJj5Pc7WUnxTY566RVJiPQ0u3psjgUagHnBi/k5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xudmM+jCbqI1mUy3ER2wCa7Pg592HDwdTucH41x+uk=;
 b=AQcJv9onlSpV0pGNTY5bXplJA5Ui5ACY58W/O3eP5CbcSNtwk6kclw56jwE5QPuvvOk5DOP2ii5rM/r9Pa+Azm6F5D6Ws4KUkJUOr396Afmjdt0d64csYWQA28+Zy4oE8CcDtPmxRDeraUquht63S9ss95Xb81D7yjVe6n6KqerkegjTnhyvXCIRNQXuDDR/bYLT7RK2ymzPORrDTqVeBz/CAekQtFeJFE06ehBRWZGhIXObUQgeWqLFe/eqPwfxGkNj9rztaaJ8ZoAg3UZiSWZ8RvDSq3dlZUswL+gkmX2qiAaNb2J/y/gelrialbF0Kqfko2c9YAJIQQgRpJoS1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB6021.namprd12.prod.outlook.com (2603:10b6:8:87::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Tue, 25 Aug 2026 08:31:28 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 08:31:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 25 Aug 2026 17:31:17 +0900
Subject: [PATCH] gpu: nova-core: fix incorrect naming/framing of GSP-FMC
 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB1I4k9pryIuYpzYKZhKRkUI3
 t3YLr/FewmEIpPAq0gQaWfhb8jQZQHubcNEyGM2GGVa9TAVTrKgnx1GCnYmHK2yjdJPX9cacrR
 E8nz8hl3/t2zDh9x6X+A8LyPVxOpyAAAA
X-Change-ID: 20260723-gsp-fmc-rename-da0a5019f441
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS0P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9d::20) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd164aa-af55-480b-efed-08df0283424b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	lpHaDqI9dAVa7AOslNdGF/r+ut/ZO8bBiwEPtEM9R+gFsBxZoEcnEpMiM6QaRAqnMqaUC6KPNlKBLM6B98Nwj3w5zf9SQbpT790LY95d4IHoB1xHv97P9Sk4Dd0rVE+gunPScxR7c+vKhv8ja0KZrfqcrLemr9Apf7bv2tO9vV3aCMXIkAYiulHXANxc5iDRkYNx01ngyZLWRBaNDVXFnOW+WTWR4QsNi50nsSvPtIQuryYWoKYGTrl7DQu6u8u/QVr5iWVoc3eOF9IJb52LkOnCPfdUzAfQNhZlDI1TcjMtFYmgufU4oUx36puKxwvx/eYUe533XulelSdtiCPHj2uZWkGSWbjOQH/woziqESKe6OSeB0FxuY1GSNpBJXd5tkewtyjFW94nxKzPuEYkR9+NQCYI2nTybSMkk7f9HNwS55K3RzwhTXz/H9ozWcZrsXkdm8an5jbHBYhQZgbaJ6xY196iMlMtsoiDXVtm8u/hFo1vKt3HY0b0E+v4lNkQn0s8RZjctVFxLRkr+28A3JNgrdJS9BBO0X7DzHbZpF6G/FjIp7XCq0IXHrApodwtgF1/dfyhTNolJQ9hL1qMuva9EHIbmn1L4hRYbneG6h4g0hR+0wJrdu8Ne/y92BCnaiZ9H0F4XAAfoiyQocxCcaHPWH6aD361JGqg7kh24Mc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW5sNjQycktQSjhsbGtNYU5UdUxoT0FQU2ZMNTFNa3BjTnlrTXU4WGVIOFgw?=
 =?utf-8?B?eEFtY3VWMDdLQ3V3QVd2MWNXVWtzeXJPQWNLR0o5WHNVayt4WDZyaTlGc2Zp?=
 =?utf-8?B?emZmckNjczQrLzZaWTQrUkNrVjNpczdKdjhXbTZqZmo0VUl3WG1veWNSNjN0?=
 =?utf-8?B?dC9KeThnRVpvc0JSS2c1Y01scEs1SHRHaHpFUG1FcG9xbCtETFAxL3FOcVJw?=
 =?utf-8?B?TytDT2lkNDZkS0lIU2Z6MzdyWks4bmZVdExlQUZDUWw2dWVid1NXTXRFanNV?=
 =?utf-8?B?M2hsWHpkOFFwbWNFMVFOV0toeThaYzVOOEN1Q0ZIb2hRc2lIM2I0MG9RQnVQ?=
 =?utf-8?B?YUZnYWFwaWV1bWw4bXB0SFUvaFBLcHJTaFlDalB5a291c3lRaHhoRnZMbUZO?=
 =?utf-8?B?VDU3NGRPcGIyUVZXb25vT3pXcFVFeWFORTJoaXNIeEhWTS9MaUZObHBDRFFT?=
 =?utf-8?B?dlBWNTloY29ycmEyVDJPTE01UEViZ3ZianJteTJDWnIrNTdSM0dKN0xYYmVP?=
 =?utf-8?B?MC9iRTVoZlBFdTF3Q2h3blRDY0N4aURKTmJWQ3VUSkdVb0lIeXZkRXlveDB5?=
 =?utf-8?B?bE5UV2ZMdmN5RWZ4dW8zc0JVS2Vmc0FWSllHVVk5WFZuR0wxTG5XNEJFeWpC?=
 =?utf-8?B?dkNiN3FHWUJvM2RjamtvUXNaVUdXMjZVTmhiZVBaZGc1UFVkenIvYTl1blRj?=
 =?utf-8?B?SThscDdwK2VidVpMRTZlbjNIWXFvWkdaQmt0c3BySXNVSzVOVmlUM3E3UGVN?=
 =?utf-8?B?OElsNlgzVzB3S1p0YmJSZFltQ3p5RE1yTktlZDhJUDdoNHhvdXl2blQ5YnZC?=
 =?utf-8?B?enV6MDFza0lxMW81VUdZUExSWWw4TklKZ1VpTmRkTWV2TTRLWXluRW1RRXk5?=
 =?utf-8?B?WkJRVlNhREZhUitnMi94enZwam5UOWZ1RmkzR2N6b1ZXa3VTMEJ2NTQvOVFZ?=
 =?utf-8?B?akpYUTh1WStlVUpIM3Fud2hJN2l3aUZoVG5sM0NMVUpucndZbFQ3YnVZNFUv?=
 =?utf-8?B?L25IcTJpZEkxa1ZyRXoyTmIvWGVVQkRiRkxxREdOOTFFek1YRTc1REJlbFhB?=
 =?utf-8?B?OEVkVTFHa29Bb2RDM2Q4Mlg4MEpaN1lCWGR4M1BjMkJ1a1creEtKTUFJZytj?=
 =?utf-8?B?cjJ1QUJNaGpiSEcxS2llQjdFMkR6c21URHBtODh0Mm1ROUROd3RHcWowMWhE?=
 =?utf-8?B?akJyakJPa3BFaVZuNG5aMlBrUk1ydHl0WVU1TUJUQW9ScEkyeGd6RStyd3lY?=
 =?utf-8?B?SU03VDlZdW9iWGErU3J1NHZSclMzWGdyNVBXVHVGaTlmV1IxeTZKV1FZbStu?=
 =?utf-8?B?czMraTU5WHV0citMcTFzUGgwZE9oSDlyVjhSb1NjWjJpVERWZ2tYRkZqNVlm?=
 =?utf-8?B?WjBLazhiRk1xS0srbkNjQk1YZWdrWWRNVnBsTUdJcno3bGlPd1RrSW56aXlM?=
 =?utf-8?B?RmQvZ3NsWUxNMkRSdUpvTlRwclRuMkhPVmluWjBPRGRkdmtJeUhoMzdFZDNj?=
 =?utf-8?B?RitaTG5sNVI2OUdRUy80a3NKa0ZJKzJqeXFqMzc4c3QwRXlCRENRRVRBdzhT?=
 =?utf-8?B?eFJGdjBRa0hXNXlROXFtMG5vS1ltVzFLSkYxRUNFN3NQTW5HL2I0SXE3RTBO?=
 =?utf-8?B?bFhkNktITEUrSEViYUdFeWxaRkovYWVLSjJBNFY4MG5Lc0NQZGRIeGZXeTI0?=
 =?utf-8?B?RENyV1BIeCtKRUJCaHpPbGVkRFpWaGFUTmVGWlRYZHo5Q0FZaC9ScWJtKzZh?=
 =?utf-8?B?YmwyNkI2RG1OOTdiN1JBMTJjQU1zRXlkOEozcDkvMy9yUWhnWGVmNm40R1la?=
 =?utf-8?B?QjJ1WXRvbHQ5QnNMSXd6U1AwSlRCN3BzcXNXUmNQVjVMNEZsbzBMR2JZRnV6?=
 =?utf-8?B?elpXdmtqNERiaUZvUXhCZjRqU2wrVmE1U0JXTlVsL1hRLzBDTzVrZGdNWWVN?=
 =?utf-8?B?aDlLY0lVWlZma1crUFlGaGFYRTRTdmhZSWxzZm41b2k1M3kxT20zdDFFODU3?=
 =?utf-8?B?SmxNYkR3SVFNU2hwTzlka29ia2pNaVBvbFMyRkNzM3NaV3grcUxIdmc2TVZ3?=
 =?utf-8?B?RXBRbCtGWVJLVis5MjEwMmpLeUpNVDhWMEtaTnN3Q1VoUlJQSTFFQ1cwZHIz?=
 =?utf-8?B?Z2NGVTg3djFlZW9WLzJqblYzVTFXOGYxcVM2NXNFaTg1NnVkWTk1S1E3U1Bz?=
 =?utf-8?B?TUdCWjZ1Z2NONU1sejBQdDE2a0YzN0xHWjRaZ1VlaGVsWVppZ1BjNGFnNW5U?=
 =?utf-8?B?TDkrUnVmSVNSMklnUEZsZ3JrZzN2bnpZLzgvMFVlYUo5TCtmTnZqYmJPQU41?=
 =?utf-8?B?VlYyN01yVElIdXYvcW5ESVViMXJFVFc2cjBpeU1qWmtocWtTQ2YyWlpaSm12?=
 =?utf-8?Q?cFte6oO47K2qB3Z7W2nvDHIJqoOIUCPf6yz55+zzkJpqc?=
X-MS-Exchange-AntiSpam-MessageData-1: A5LyenEDPQNX6Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd164aa-af55-480b-efed-08df0283424b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 08:31:28.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7TbpR2gQrN+CZzk2QVWrQca7+2PGue8bEwPyJkETeeq1/Ogrbvug4+USZSCspeqBnEBLpA+xNKaYjT8j6FAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6021

The GSP-FMC firmware code lived in `firmware/fsp.rs` and described
itself as running on the FSP. This is incorrect: GSP-FMC is loaded by
the FSP, but runs on the GSP as the loader and verifier of GSP-RM. FSP
secure-boots on its own before the driver even starts.

Correct the naming and files used to contain the GSP-FMC code, by:

- Renaming `firmware/fsp.rs` to `firmware/gsp_fmc.rs` (as GSP-FMC is not
  the FSP firmware),
- Changing the prefix of some declarations in that file to `FMC` or
  `GspFmc` (interestingly some were already correct),
- Fixing a mismatch (FMC means "First Mutable Code") in `fsp.rst`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/fsp.rst                |  2 +-
 drivers/gpu/nova-core/firmware.rs                  |  2 +-
 .../gpu/nova-core/firmware/{fsp.rs => gsp_fmc.rs}  | 55 ++++++++++++----------
 drivers/gpu/nova-core/fsp.rs                       | 29 +++++++-----
 4 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova/core/fsp.rst
index 52d618d22bb8..cc2e3bbb9b53 100644
--- a/Documentation/gpu/nova/core/fsp.rst
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -42,7 +42,7 @@ On **Hopper/Blackwell** GPUs, FSP replaces this multi-stage process with a
 single message-driven interface::
 
      FSP (hardware root of trust, boots from ROM)
-          -> FMC (Falcon Microcontroller, verified by FSP)
+          -> FMC (First Mutable Code, verified by FSP)
                -> GSP-RM (verified and loaded by FMC)
 
 The driver only needs to:
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index b49613a90bf0..c16fee6e2b2a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -23,9 +23,9 @@
 };
 
 pub(crate) mod booter;
-pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod gsp_fmc;
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/gsp_fmc.rs
similarity index 71%
rename from drivers/gpu/nova-core/firmware/fsp.rs
rename to drivers/gpu/nova-core/firmware/gsp_fmc.rs
index 5462e318410a..fbb0af133f24 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp_fmc.rs
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-//! FSP is a hardware unit that runs FMC firmware.
+//! GSP-FMC (First Mutable Code) is loaded by FSP into GSP to serve as the loader and verifier of
+//! GSP-RM.
 
 use kernel::{
     device,
@@ -17,16 +18,16 @@
     gpu::Chipset, //
 };
 
-/// Size of the FSP SHA-384 hash, in bytes.
-const FSP_HASH_SIZE: usize = 48;
-/// Maximum size of the FSP public key (RSA-3072), in bytes.
+/// Size of the GSP-FMC SHA-384 hash, in bytes.
+const FMC_HASH_SIZE: usize = 48;
+/// Maximum size of the GSP-FMC public key (RSA-3072), in bytes.
 ///
-/// The FMC `PKEY` tag may be shorter, so the remaining bytes are zero-padded.
-const FSP_PKEY_SIZE: usize = 384;
-/// Maximum size of the FSP signature (RSA-3072), in bytes.
+/// The `PKEY` tag may be shorter, so the remaining bytes are zero-padded.
+const FMC_PKEY_SIZE: usize = 384;
+/// Maximum size of the GSP-FMC signature (RSA-3072), in bytes.
 ///
-/// The FMC `SIGN` tag may be shorter, so the remaining bytes are zero-padded.
-const FSP_SIG_SIZE: usize = 384;
+/// The `SIGN` tag may be shorter, so the remaining bytes are zero-padded.
+const FMC_SIG_SIZE: usize = 384;
 
 /// Structure to hold FMC signatures.
 ///
@@ -34,23 +35,27 @@
 #[derive(Debug, Clone, Copy, Zeroable)]
 #[repr(C)]
 pub(crate) struct FmcSignatures {
-    pub(crate) hash384: [u8; FSP_HASH_SIZE],
-    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
-    pub(crate) signature: [u8; FSP_SIG_SIZE],
+    pub(crate) hash384: [u8; FMC_HASH_SIZE],
+    pub(crate) public_key: [u8; FMC_PKEY_SIZE],
+    pub(crate) signature: [u8; FMC_SIG_SIZE],
 }
 
-pub(crate) struct FspFirmware {
+pub(crate) struct GspFmcFirmware {
     /// FMC firmware image data
     pub(crate) fmc_image: Coherent<[u8]>,
     /// FMC firmware signatures.
     pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
-impl FspFirmware {
+impl GspFmcFirmware {
     pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
         let fw = request_tlv(dev, chipset, "fmc")?;
         let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(dev, "loaded fsp firmware v{}\n", tlv.get_string(b"VERS")?);
+        dev_dbg!(
+            dev,
+            "loaded GSP-FMC firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
 
         let fmc_image_data = tlv.get_bytes(b"BLOB")?;
         let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
@@ -70,34 +75,34 @@ fn extract_fmc_signatures(tlv: &Tlv<'_>, dev: &device::Device) -> Result<KBox<Fm
         let pkey_section = tlv.get_bytes(b"PKEY")?;
         let sig_section = tlv.get_bytes(b"SIGN")?;
 
-        // The hash section is a SHA-384 output: it must be exactly FSP_HASH_SIZE bytes.
-        if hash_section.len() != FSP_HASH_SIZE {
+        // The hash section is a SHA-384 output: it must be exactly `FMC_HASH_SIZE` bytes.
+        if hash_section.len() != FMC_HASH_SIZE {
             dev_err!(
                 dev,
                 "FMC hash section size {} != expected {}\n",
                 hash_section.len(),
-                FSP_HASH_SIZE
+                FMC_HASH_SIZE
             );
             return Err(EINVAL);
         }
 
         // The key and signature sections are zero-padded to a fixed maximum, so they may be
         // shorter, but must not exceed the destination buffers.
-        if pkey_section.len() > FSP_PKEY_SIZE {
+        if pkey_section.len() > FMC_PKEY_SIZE {
             dev_err!(
                 dev,
                 "FMC public key section size {} > maximum {}\n",
                 pkey_section.len(),
-                FSP_PKEY_SIZE
+                FMC_PKEY_SIZE
             );
             return Err(EINVAL);
         }
-        if sig_section.len() > FSP_SIG_SIZE {
+        if sig_section.len() > FMC_SIG_SIZE {
             dev_err!(
                 dev,
                 "FMC signature section size {} > maximum {}\n",
                 sig_section.len(),
-                FSP_SIG_SIZE
+                FMC_SIG_SIZE
             );
             return Err(EINVAL);
         }
@@ -106,11 +111,11 @@ fn extract_fmc_signatures(tlv: &Tlv<'_>, dev: &device::Device) -> Result<KBox<Fm
         // stack, then fill each section from the firmware.
         let signatures = KBox::init(
             pin_init::init_zeroed::<FmcSignatures>().chain(|sigs| {
-                // PANIC: src and dst lengths are both FSP_HASH_SIZE (verified above).
+                // PANIC: src and dst lengths are both `FMC_HASH_SIZE` (verified above).
                 sigs.hash384.copy_from_slice(hash_section);
-                // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE (verified above).
+                // PANIC: dst is sliced to src.len(); src.len() <= `FMC_PKEY_SIZE` (verified above).
                 sigs.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
-                // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE (verified above).
+                // PANIC: dst is sliced to src.len(); src.len() <= `FMC_SIG_SIZE` (verified above).
                 sigs.signature[..sig_section.len()].copy_from_slice(sig_section);
                 Ok(())
             }),
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index ab685fb4168f..d2be19b8bff9 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -3,9 +3,12 @@
 
 //! FSP (Foundation Security Processor) interface for Hopper/Blackwell GPUs.
 //!
-//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then FSP, then GSP.
+//! Hopper/Blackwell use a simplified firmware boot sequence: FSP secure-boots independently before
+//! the driver starts. The driver then sends FSP a Chain-of-Trust request containing the GSP-FMC
+//! image. FSP authenticates the image and launches GSP-FMC on the GSP RISC-V core; GSP-FMC
+//! subsequently authenticates and boots GSP-RM.
+//!
 //! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usage.
-//! FSP handles secure boot directly using FMC firmware and Chain of Trust.
 
 use kernel::{
     device,
@@ -32,9 +35,9 @@
         Falcon, //
     },
     fb::FbSizes,
-    firmware::fsp::{
+    firmware::gsp_fmc::{
         FmcSignatures,
-        FspFirmware, //
+        GspFmcFirmware, //
     },
     gpu::Chipset,
     gsp::{
@@ -267,7 +270,7 @@ fn frts_vidmem_offset(hal: &dyn hal::FspHal, fb_info: &FbSizes) -> Result<u64> {
     /// Returns an in-place initializer for [`FspCotMessage`].
     fn new<'a>(
         fb_info: &FbSizes,
-        fsp_fw: &'a FspFirmware,
+        fmc_fw: &'a GspFmcFirmware,
         args: &'a FmcBootArgs<'_>,
     ) -> Result<impl Init<Self> + 'a> {
         let hal = hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?;
@@ -296,13 +299,13 @@ fn new<'a>(
         .chain(move |msg| {
             msg.cot.version = version;
             msg.cot.size = size;
-            msg.cot.gsp_fmc_sysmem_offset = fsp_fw.fmc_image.dma_address();
+            msg.cot.gsp_fmc_sysmem_offset = fmc_fw.fmc_image.dma_address();
             msg.cot.frts_vidmem_offset = frts_vidmem_offset;
             msg.cot.frts_vidmem_size = frts_size;
             // frts_sysmem_* are left at zero because this path places FRTS in vidmem. The sysmem
             // fields point to an FRTS buffer in sysmem instead, for systems without VRAM.
             msg.cot.gsp_boot_args_sysmem_offset = args.fmc_boot_params.dma_address();
-            msg.cot.sigs = *fsp_fw.fmc_sigs;
+            msg.cot.sigs = *fmc_fw.fmc_sigs;
 
             Ok(())
         }))
@@ -381,12 +384,12 @@ pub(crate) fn boot_params(&self) -> &Coherent<GspFmcBootParams> {
 
 /// FSP interface for Hopper/Blackwell GPUs.
 ///
-/// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot
-/// has completed. It owns the FSP falcon and the FMC firmware, which are used for the subsequent
+/// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot has
+/// completed. It owns the FSP falcon and the GSP-FMC firmware, which are used for the subsequent
 /// Chain of Trust boot.
 pub(crate) struct Fsp<'a> {
     falcon: Falcon<'a, FspEngine>,
-    fsp_fw: FspFirmware,
+    fmc_fw: GspFmcFirmware,
 }
 
 impl<'a> Fsp<'a> {
@@ -422,7 +425,7 @@ fn wait_secure_boot(
         const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
 
         let falcon = Falcon::<FspEngine>::new(dev, chipset, bar)?;
-        let fsp_fw = FspFirmware::new(dev, chipset)?;
+        let fmc_fw = GspFmcFirmware::new(dev, chipset)?;
 
         read_poll_timeout(
             || Ok(hal.fsp_boot_status(bar)),
@@ -434,7 +437,7 @@ fn wait_secure_boot(
             dev_err!(dev, "FSP secure boot completion error: {:?}\n", e);
         })?;
 
-        Ok(Fsp { falcon, fsp_fw })
+        Ok(Fsp { falcon, fmc_fw })
     }
 
     /// Sends a message to FSP and waits for the response.
@@ -540,7 +543,7 @@ pub(crate) fn boot_fmc(
     ) -> Result {
         dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
 
-        let msg = KBox::init(FspCotMessage::new(fb_info, &self.fsp_fw, args)?, GFP_KERNEL)?;
+        let msg = KBox::init(FspCotMessage::new(fb_info, &self.fmc_fw, args)?, GFP_KERNEL)?;
 
         let _response_buf = self.send_sync_fsp(dev, &*msg)?;
 

---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260723-gsp-fmc-rename-da0a5019f441

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

