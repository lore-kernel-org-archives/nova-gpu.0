Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522673C1412
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147339; cv=fail; b=nvXxA6Bd4mGWX9zObf+dvT87iBry+gmuAbeYPPf/L2Ab5K53wBkDno43snSof0/wRbTnx7SrgiPlmN8VU3a9mEV9gcnIiQvfRnyWUzTTi6JjQGlRa11eBs7emfcpRos1RnM96cM8Fc316qpddfVliwZKzG6kwkDWGTB4Mm47jFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147339; c=relaxed/simple;
	bh=lVhwz9YtSqV2qNZQ/0NgcPaSioEA1luD3prlCMq5pU4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tlcfJmk38ILqbtAY7Ec0TgRNTu8wzMU80IK6qWQgsLP5ykwx8NUiicxfrzuNaitXDRr09T7ZUFcjuC2qOrAfWHBpEA9N/sqLtrtQUvRavDovbrLmOwFryzhA426S7+BkCwH2LG7ZJQueXooA/oymjlnkXHEVq4bxvnuJjontMYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cN0fjb3U; arc=fail smtp.client-ip=52.101.62.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cN0fjb3U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaS+KQG+MDQagyA/Hcfzjg+nuu5wVeJHVRvEazI/BEzm65vQh7uaip2Tu+YvstelalEgLV1QJqe27KgebcaPj53l83O/a1pdFwtiHg6aRvU+XtvxG/n1lFNMgOyWru+yRqhVTDsbQnXahTprF+jcbk5ab5ioesYfc5t/jMCJ0NycTAFpG6SYEf+S0dtN4QeH3VIuoMdMpM3atNIxl3iCNKKet9DCUDJmleICi1Ko7doLutX2KUlzc9QSk91g096JYESEqKM9SRHsobzwkIRbe9Yr5n6+yH0iA9E2VXSKh5gCVOXlqZ3MlzZyYdi2/pBeZc9KX6K7xzstCliOIOciIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTNNxEWg7FkvKvBO6qh/PXHQQnKYtSNqsrhhBtpv1EY=;
 b=RUDLGQ/8xaykjjdXFYD9MiFBq9CtN/BmJrfxLoudzAhF4yWRS7jK4YEqLBvFvhS2EZtF9dNOPxy0NTC443ilqcwDuyyBaiquiM6zxi3iiuZHN9RYIBK/H7cBVHysjE0/+Pkmx0PvK/9oGrhp7PuaRzsB9VXud5xwaryQQJvYWW2axnpO+lsf/+6lKYGhLvUNpn6I7QyYR8RqMGCstA821opF8AO3aBvK/Or6PfDTGnX8EMsQoGHXLS1XraqkVlXa4w3yyHzUL++bKrAulCE7iaM2WhzbFEaov8rrTiM+bUyRyHXGITEyHUEwoAMZ+xLCvXX8NizJCNmtp1eYm4Rz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTNNxEWg7FkvKvBO6qh/PXHQQnKYtSNqsrhhBtpv1EY=;
 b=cN0fjb3U+SbxHR9ajWvyFNewpeeaal1+IV28W3ZQG9GySGNKDzbgSq4UJSQB+jFxXLWu1Vvn2UpvEvehlTEEehpqRxI1f39tEHhgljcZCXA3c/CT4XnvkQ8n/DTGLNnQU0byz2Yx77w0oCNP6no0pgP9/O3/D/T2Fvvtlq+G7j5cZ54zHtiAzOZkVx5ulauZq94QN/8qcJZiZmNScXlw3oc+XI47Ch5ad20DUCQYbUujj358lPnhIict1MkciwzjMDlWJwe6oKn+B0yGTY6Dx6kEcw7W3Wi+7kz91Wy/HDxOQO5PasIW5vGW9K4v0hl21WtGt1K/OqZ8H/ZgejU4lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:15:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:15:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Jul 2026 19:15:15 +0900
Subject: [PATCH 2/2] gpu: nova-core: use kernel lossless integer conversion
 module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-as_casts-v1-2-6ea704ff25d8@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:378::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: b40bc5e3-8b19-46a8-e93e-08deebc7fc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10070799003|18002099003|10067099003|22082099003|56012099006|11063799006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	4YMgtzRPQM/94q5FfKAlznMnbxBuaSXjcj3Ktvh/SDHfFcKZAYajzk+jsiyvd+tlk3YGQegblr76osWWmwrhawnK/pDuWd78bgTSonZbcgNFMCFg4iibbRzAuAXUIc0uWRM+L870jMMY38fU48RF2lyDpYyG47Ec+07PXGGb03RsGBQf+eUbo0ZKcMs9WYd2xwxMLgemHyq+5PXefoMshFdjlW6G2lkmcBv7BUiHbio8KmYoOYExpEbyR9atklvSNOliG2+DDii5dXVSTN44frcVsLxFEnTxUiEyjktEaYVwYqAMWUzay28GXopzTOuEcADGKReCLUd3UlNW650Rit4Uc7sR5z9QsYlhsT8Asi3F6+crxH2bIzdAMcAF2ystGlOD71nHTeJ2nzDoIkvNeC0JxACMDlCJNNtysTEflUYKUqMcUma/X6M8roCn3N8MBH6puM9pdnyw0R7Dogd1AFnrW90PAtDp8q26CAng0bJ4pDkSyMuV+4daRabE9JH66PzmBxS+txun2EVRAx/qrZcaEHgQdUjHqSZYEAcBli6L8usgA1I/tpQEShInb5pEr8w2EvhwOTiM+LXBEHWgxh620thqKeYPC0GAB6Qf3A/4g6kA1vUUwHs3lnEHOgqvHG/yO0k+YRxRgZZ+JKiTCGSK1VCF+aUexZpAYkwDhEhXPoScEc812qjdTm0/2betoGRt1rI8nrum4oyUYlty/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10070799003)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUgrcmhvYkEraXV0Rk1lQUlZaTViUjNrZ1F0T1BzYll3ZEU1dGpzdzM3Qllv?=
 =?utf-8?B?UGttd0grU3NTSElmZitmVFFQV0NkWkJoMGIranVrR2hlOWlLUHJkYmtYTG50?=
 =?utf-8?B?Q2hzOG9iNU96VFdTWG9vRGp6MDNTN2VtRkU3RDdiZlBNVkJsTHpSdmFkaFYy?=
 =?utf-8?B?SzEwSWtKWCt1c1pweGpMeU8vR3pQNWllWUp4aWdBUm53MXBYbkVIZ3o4bjRt?=
 =?utf-8?B?cTF6QkFPRExZV2VsUlgvTUo2TjBFem8yanArdFlIMW9NWkVLZFc5YWo0eWgy?=
 =?utf-8?B?OE9yZG44MVFuR0Fya3VhakprUUplUVRld3didmtiQXUwcm5abFRFbVVUNGMr?=
 =?utf-8?B?SGY0dzcxRUdPNzZqOVpoOXl6djFmbkxlU0VMSzVvWDZFVzJ0bFlaMyt1N2l5?=
 =?utf-8?B?QVB4WjNvWmFFcEZIOEVOc3lOVnhsZDJxQ216YUZmdnQzaEVqeHRMcWlMWkVp?=
 =?utf-8?B?TnZvL0c1S1FuUXhYeXUycm9VTTJLR2tlckdDdzMzSEM0NUtGUEJoU21GeW9u?=
 =?utf-8?B?eGhzbWxMVlp2OUlrd3ZlSXl1TkxNRVgwTVVyS2czWVRBeGhIM1pEbkcza0pL?=
 =?utf-8?B?Ti83MXVkQ1BxRmMzNWdQY3AydGV0b1NBc1dPelBoR2x0OGxwTFp4WkdzeW9H?=
 =?utf-8?B?ZEwzU1UrcnVVYm5MQmRZVFA3am04MTdlQ2RHRjFvY1psR2Z1Y1BCbWwwNzh5?=
 =?utf-8?B?VWkvcjlhZGtlelV6QXVzVXNGU3gxWTUrU2l6Z29WblQ4K2lIdVU4RE5oRFdy?=
 =?utf-8?B?eGlreXRWQ1lwUmVkUHVjK1pmMURVa2VtaFVnZ0k5SkMwN21FWUhhcTU4MG4w?=
 =?utf-8?B?eGpRMGxnMC92N1pqRVdyYkZ2M2dtd3FLOEwxRlpBTk9qWmk5THdFMlZrRGpx?=
 =?utf-8?B?TDBGZDl0QmhXMExqM1BZU2Z1aUF2NFVLWjNpQ2R1NWMvaElLWWxHc2tZcDVT?=
 =?utf-8?B?SW5GU2pyUy8rU2F1dTUrcHdiV2ZnMjhiU0p2akduNWVZMkdNUFdLWWx1RUhW?=
 =?utf-8?B?MVRrVHpod1ZUWVZudWJNbWkwd0lSVmpZaHVseG1rTzNWelZiQTE1UnlJMEdk?=
 =?utf-8?B?VjRkYXlQL3pwbHREeFJSdDFiclJaUlhYOGdibW1YTHhDYkxQeWRKWU9BYUVE?=
 =?utf-8?B?SUxJN3JENjFVeHRMQ2RDdTJsMURSUm1jZnV4d0h5NHQ2ZThGajZna040Wkh0?=
 =?utf-8?B?Y2VQcVV2M2d0K2JWekgvZkd5ZVZVS201d05oMW04MVR5SFBZSGJUc1N2dXhv?=
 =?utf-8?B?bGhudkNId0Z0WEtJVkx1dU1ZUEdHbXRuRjJ6VVdxSXlSTUhabGdRK1Zwd2cx?=
 =?utf-8?B?cjRXc2FvajhvV3hPUTdlcnlRdTVVN2cwNzl4d3FDV1dodmN6STdhRGp5NkRT?=
 =?utf-8?B?WUgwYnREM1M5SmwyT2tjdUpudHdadG04T3RPU0F6eGRyY3RhMi83Q2M2cHlF?=
 =?utf-8?B?aTUxWERWaXAzMFREQmFiQnhlQmJPRmxvU1ptTXp2TmFMUk1kOXhIbTRXSW9k?=
 =?utf-8?B?bTcvRWxWZmFXSjcveWc5dlZtWmxDbDNqS09vNWw3SC9UUmY0czlFNVQvSFNm?=
 =?utf-8?B?Q3BsdmtCamhVeXAwTHR3eTNUTCtheW42cHBuZzlEb3d6WHVEWGIzMzVOYzc1?=
 =?utf-8?B?QkZiYjZTVmFBcFJlTFVjcVVIbUhvVHJWV3diZzVmM2h2V3lOc1BHUVFIa2s5?=
 =?utf-8?B?RjE1MlR1cGxPcStqK2pubXd5eXRGcGtidVdhaFJhRDk4aDE4RmFKUTcweW1m?=
 =?utf-8?B?UGZpbktQaC9ya0lkQlBhSVowbSs5SzFoVmRLdUwyUXh3MHlzWUVqMnNySDBP?=
 =?utf-8?B?UjIwR0ZZc2cyV3dsWGZra1l5ME94SkVXV3ZFVDYyckRXdWNkRmVwbzVwZ2VO?=
 =?utf-8?B?UE12UzlqWVFMU2d2dy9ZM2FmSlQ2bmtNbmN3dm9jVFN4Q09sSXJxVUZVUS8w?=
 =?utf-8?B?R1Y0ODNVa05FWkxzZ0VNbWxlNGdiSk1wTllGbFVvZnhLNld0VEdibDR2QlBJ?=
 =?utf-8?B?Qisxa25iRG44MFdkWEdrSFFEZVdFazBRcCtJdVU0Qi9SNm5SVXZmaFJJV0lh?=
 =?utf-8?B?SVUrTXVsYW5HN0IwTlMweFJzMEI1QjdFb250ZjZ1WDAzYWlpc3BrRWRzUUtZ?=
 =?utf-8?B?RmtNcWhXd1hnMnk3T09QemU5R0p3RWErZmhGWTZtYkx2YUxkWm1QdjNxeVgr?=
 =?utf-8?B?dHh6dFNwV0l0RG5DeXU0VFNZVjhjMnM3NVh3NTF2RDgwdFcvbFZxRmtneHpt?=
 =?utf-8?B?YUdVc3h0M01iVWNWYmxUUHNSbnV1YURLR0tqbEVUamVGSjdrRHFIK1I3aDNH?=
 =?utf-8?B?ajQxNHdkcUhONkV1Y2UwUHFpYVRjM2lWb29XczRKZWp1OGJmcXFMekdaMGQy?=
 =?utf-8?Q?395h8vJ7MuQ/0dq8LVUtxEMGDF7ye+o+eSxBiUpMtFdNq?=
X-MS-Exchange-AntiSpam-MessageData-1: OpMCxTxbE840sw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40bc5e3-8b19-46a8-e93e-08deebc7fc45
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:15:29.7931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdo7bu5S2Coyof45aind72rPrxGovNBuOocfZkBjZ6ais/kAEv1tRgYQMMRH4BpBEtyqhMg92B4T9Jp62zrE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949

The `kernel` crate now features a copy of our lossless integer
conversion routines. Switch to the kernel version and remove our own.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                    |  10 +-
 drivers/gpu/nova-core/falcon/fsp.rs                |   2 +-
 drivers/gpu/nova-core/fb.rs                        |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs              |   6 +-
 drivers/gpu/nova-core/firmware.rs                  |   8 +-
 drivers/gpu/nova-core/firmware/booter.rs           |  10 +-
 drivers/gpu/nova-core/firmware/fwsec.rs            |   2 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   2 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |   2 +-
 drivers/gpu/nova-core/firmware/riscv.rs            |   6 +-
 drivers/gpu/nova-core/fsp.rs                       |   2 +-
 drivers/gpu/nova-core/gsp.rs                       |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs                    |   8 +-
 drivers/gpu/nova-core/gsp/sequencer.rs             |   2 +-
 drivers/gpu/nova-core/num.rs                       | 211 ---------------------
 drivers/gpu/nova-core/vbios.rs                     |   2 +-
 17 files changed, 35 insertions(+), 246 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 94c7696a6493..3133c6e2f229 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -23,6 +23,10 @@
         },
         Io,
     },
+    num::{
+        self,
+        FromSafeCast, //
+    },
     prelude::*,
     sync::aref::ARef,
     time::Delta,
@@ -33,11 +37,7 @@
     driver::Bar0,
     falcon::hal::LoadMethod,
     gpu::Chipset,
-    num::{
-        self,
-        FromSafeCast, //
-    },
-    regs,
+    regs, //
 };
 
 pub(crate) mod fsp;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 52cdb84ef0e8..aad919c8471d 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -16,6 +16,7 @@
         },
         Io, //
     },
+    num,
     prelude::*,
     time::Delta,
 };
@@ -28,7 +29,6 @@
         PFalcon2Base,
         PFalconBase, //
     },
-    num,
     regs, //
 };
 
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 725e428154cf..a635be13d0d0 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,6 +10,7 @@
     dma::CoherentHandle,
     fmt,
     io::Io,
+    num::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -23,7 +24,6 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::FromSafeCast,
     regs, //
 };
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index 6e0eba101ca1..91461433c5d0 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -11,7 +11,10 @@
         },
         Io, //
     },
-    num::Bounded,
+    num::{
+        usize_into_u32,
+        Bounded, //
+    },
     prelude::*,
     ptr::{
         const_align_up,
@@ -23,7 +26,6 @@
 use crate::{
     driver::Bar0,
     fb::hal::FbHal,
-    num::usize_into_u32,
     regs, //
 };
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 1e89390209f5..03571251b490 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -10,6 +10,10 @@
 use kernel::{
     device,
     firmware,
+    num::{
+        FromSafeCast,
+        IntoSafeCast, //
+    },
     prelude::*,
     str::CString,
     transmute::FromBytes, //
@@ -21,10 +25,6 @@
         FalconFirmware, //
     },
     gpu,
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
 };
 
 pub(crate) mod booter;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index d9313ac361af..0645677dcc30 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -10,6 +10,10 @@
 use kernel::{
     device,
     dma::Coherent,
+    num::{
+        FromSafeCast,
+        IntoSafeCast, //
+    },
     prelude::*,
     transmute::FromBytes, //
 };
@@ -31,11 +35,7 @@
         Signed,
         Unsigned, //
     },
-    gpu::Chipset,
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
+    gpu::Chipset, //
 };
 
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 199ae2adb664..e856eb698300 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -19,6 +19,7 @@
         self,
         Device, //
     },
+    num::FromSafeCast,
     prelude::*,
     transmute::{
         AsBytes,
@@ -43,7 +44,6 @@
         Signed,
         Unsigned, //
     },
-    num::FromSafeCast,
     vbios::Vbios,
 };
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 039920dc340b..7d82c0ca33a5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -17,6 +17,7 @@
         register::WithBase, //
         Io,
     },
+    num::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -51,7 +52,6 @@
         FIRMWARE_VERSION, //
     },
     gpu::Chipset,
-    num::FromSafeCast,
     regs,
 };
 
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 99a302bae567..87ed9d4ede08 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -8,6 +8,7 @@
         DataDirection,
         DmaAddress, //
     },
+    num::FromSafeCast,
     prelude::*,
     scatterlist::{
         Owned,
@@ -25,7 +26,6 @@
         Chipset, //
     },
     gsp::GSP_PAGE_SIZE,
-    num::FromSafeCast,
 };
 
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 2afa7f36404e..572c2815a053 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -7,14 +7,12 @@
     device,
     dma::Coherent,
     firmware::Firmware,
+    num::FromSafeCast,
     prelude::*,
     transmute::FromBytes, //
 };
 
-use crate::{
-    firmware::BinFirmware,
-    num::FromSafeCast, //
-};
+use crate::firmware::BinFirmware;
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 8fc243c66e35..ae529652b3eb 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -11,6 +11,7 @@
     device,
     dma::Coherent,
     io::poll::read_poll_timeout,
+    num,
     prelude::*,
     ptr::{
         Alignable,
@@ -42,7 +43,6 @@
         NvdmHeader,
         NvdmType, //
     },
-    num,
     regs, //
 };
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 69175ca3315c..75f7bfe50976 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -11,6 +11,7 @@
         CoherentBox,
         DmaAddress, //
     },
+    num,
     pci,
     prelude::*,
     transmute::{
@@ -36,7 +37,6 @@
         GspArgumentsPadded,
         LibosMemoryRegionInitArgument, //
     },
-    num,
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 070de0731e95..513542ed7924 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -16,6 +16,7 @@
         Io, //
     },
     new_mutex,
+    num,
     prelude::*,
     ptr,
     sync::{
@@ -26,7 +27,7 @@
     transmute::{
         AsBytes,
         FromBytes, //
-    },
+    }, //
 };
 
 use continuation::{
@@ -50,7 +51,6 @@
         GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
-    num,
     regs,
     sbuffer::SBufferIter, //
 };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4db0cfa4dc4d..755015a2eff1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -11,6 +11,10 @@
 
 use kernel::{
     dma::Coherent,
+    num::{
+        self,
+        FromSafeCast, //
+    },
     prelude::*,
     ptr::{
         Alignable,
@@ -38,10 +42,6 @@
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
     },
-    num::{
-        self,
-        FromSafeCast, //
-    },
 };
 
 // TODO: Replace with `IoView` projections once available.
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index e0850d21adca..2ee84178628f 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -10,6 +10,7 @@
         poll::read_poll_timeout,
         Io, //
     },
+    num::FromSafeCast,
     prelude::*,
     time::{
         delay::fsleep,
@@ -32,7 +33,6 @@
         },
         fw,
     },
-    num::FromSafeCast,
     sbuffer::SBufferIter,
 };
 
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index 6eb174d136ab..3921ef6f238e 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -5,217 +5,6 @@
 //! This is essentially a staging module for code to mature until it can be moved to the `kernel`
 //! crate.
 
-use kernel::{
-    macros::paste,
-    prelude::*, //
-};
-
-/// Implements safe `as` conversion functions from a given type into a series of target types.
-///
-/// These functions can be used in place of `as`, with the guarantee that they will be lossless.
-macro_rules! impl_safe_as {
-    ($from:ty as { $($into:ty),* }) => {
-        $(
-        paste! {
-            #[doc = ::core::concat!(
-                "Losslessly converts a [`",
-                ::core::stringify!($from),
-                "`] into a [`",
-                ::core::stringify!($into),
-                "`].")]
-            ///
-            /// This conversion is allowed as it is always lossless. Prefer this over the `as`
-            /// keyword to ensure no lossy casts are performed.
-            ///
-            /// This is for use from a `const` context. For non `const` use, prefer the
-            /// [`FromSafeCast`] and [`IntoSafeCast`] traits.
-            ///
-            /// # Examples
-            ///
-            /// ```
-            /// use crate::num;
-            ///
-            #[doc = ::core::concat!(
-                "assert_eq!(num::",
-                ::core::stringify!($from),
-                "_as_",
-                ::core::stringify!($into),
-                "(1",
-                ::core::stringify!($from),
-                "), 1",
-                ::core::stringify!($into),
-                ");")]
-            /// ```
-            #[allow(unused)]
-            #[inline(always)]
-            pub(crate) const fn [<$from _as_ $into>](value: $from) -> $into {
-                ::kernel::build_assert::static_assert!(size_of::<$into>() >= size_of::<$from>());
-
-                value as $into
-            }
-        }
-        )*
-    };
-}
-
-impl_safe_as!(u8 as { u16, u32, u64, usize });
-impl_safe_as!(u16 as { u32, u64, usize });
-impl_safe_as!(u32 as { u64, usize } );
-// `u64` and `usize` have the same size on 64-bit platforms.
-#[cfg(CONFIG_64BIT)]
-impl_safe_as!(u64 as { usize } );
-
-// A `usize` fits into a `u64` on 32 and 64-bit platforms.
-#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
-impl_safe_as!(usize as { u64 });
-
-// A `usize` fits into a `u32` on 32-bit platforms.
-#[cfg(CONFIG_32BIT)]
-impl_safe_as!(usize as { u32 });
-
-/// Extension trait providing guaranteed lossless cast to `Self` from `T`.
-///
-/// The standard library's `From` implementations do not cover conversions that are not portable or
-/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
-/// [`u64`] because of the possibility to support larger-than-64bit architectures in the future.
-///
-/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
-/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
-/// destination type is smaller than the source.
-///
-/// Both options are hardly acceptable for the kernel. It is also a much more architecture
-/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
-/// explicitly depending on a specific bus width that could greatly benefit from infallible
-/// conversion operations.
-///
-/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
-/// conversion between types for which such cast is lossless.
-///
-/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
-/// `t as Self` operation is completely lossless.
-///
-/// Prefer this over the `as` keyword to ensure no lossy casts are performed.
-///
-/// If you need to perform a conversion in `const` context, use [`u64_as_usize`], [`u32_as_usize`],
-/// [`usize_as_u64`], etc.
-///
-/// # Examples
-///
-/// ```
-/// use crate::num::FromSafeCast;
-///
-/// assert_eq!(usize::from_safe_cast(0xf00u32), 0xf00u32 as usize);
-/// ```
-pub(crate) trait FromSafeCast<T> {
-    /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
-    fn from_safe_cast(value: T) -> Self;
-}
-
-impl FromSafeCast<usize> for u64 {
-    fn from_safe_cast(value: usize) -> Self {
-        usize_as_u64(value)
-    }
-}
-
-#[cfg(CONFIG_32BIT)]
-impl FromSafeCast<usize> for u32 {
-    fn from_safe_cast(value: usize) -> Self {
-        usize_as_u32(value)
-    }
-}
-
-impl FromSafeCast<u32> for usize {
-    fn from_safe_cast(value: u32) -> Self {
-        u32_as_usize(value)
-    }
-}
-
-#[cfg(CONFIG_64BIT)]
-impl FromSafeCast<u64> for usize {
-    fn from_safe_cast(value: u64) -> Self {
-        u64_as_usize(value)
-    }
-}
-
-/// Counterpart to the [`FromSafeCast`] trait, i.e. this trait is to [`FromSafeCast`] what [`Into`]
-/// is to [`From`].
-///
-/// See the documentation of [`FromSafeCast`] for the motivation.
-///
-/// # Examples
-///
-/// ```
-/// use crate::num::IntoSafeCast;
-///
-/// assert_eq!(0xf00u32.into_safe_cast(), 0xf00u32 as usize);
-/// ```
-pub(crate) trait IntoSafeCast<T> {
-    /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
-    fn into_safe_cast(self) -> T;
-}
-
-/// Reverse operation for types implementing [`FromSafeCast`].
-impl<S, T> IntoSafeCast<T> for S
-where
-    T: FromSafeCast<S>,
-{
-    fn into_safe_cast(self) -> T {
-        T::from_safe_cast(self)
-    }
-}
-
-/// Implements lossless conversion of a constant from a larger type into a smaller one.
-macro_rules! impl_const_into {
-    ($from:ty => { $($into:ty),* }) => {
-        $(
-        paste! {
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
-            /// use crate::num;
-            ///
-            /// // Succeeds because the value of the source fits into the destination's type.
-            #[doc = ::core::concat!(
-                "assert_eq!(num::",
-                ::core::stringify!($from),
-                "_into_",
-                ::core::stringify!($into),
-                "::<1",
-                ::core::stringify!($from),
-                ">(), 1",
-                ::core::stringify!($into),
-                ");")]
-            /// ```
-            #[allow(unused)]
-            pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
-                // Make sure that the target type is smaller than the source one.
-                static_assert!($from::BITS >= $into::BITS);
-                // CAST: we statically enforced above that `$from` is larger than `$into`, so the
-                // `as` conversion will be lossless.
-                build_assert!(N >= $into::MIN as $from && N <= $into::MAX as $from);
-
-                N as $into
-            }
-        }
-        )*
-    };
-}
-
-impl_const_into!(usize => { u8, u16, u32 });
-impl_const_into!(u64 => { u8, u16, u32 });
-impl_const_into!(u32 => { u8, u16 });
-impl_const_into!(u16 => { u8 });
-
 /// Creates an enum type associated to a [`Bounded`](kernel::num::Bounded), with a [`From`]
 /// conversion to the associated `Bounded` and either a [`TryFrom`] or `From` conversion from the
 /// associated `Bounded`.
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index c6e6bfcd6a1f..9bce9a4b2286 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -5,6 +5,7 @@
 use kernel::{
     device,
     io::Io,
+    num::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -26,7 +27,6 @@
         FalconUCodeDescV2,
         FalconUCodeDescV3, //
     },
-    num::FromSafeCast,
 };
 
 /// BIOS Image Type from PCI Data Structure code_type field.

-- 
2.55.0

