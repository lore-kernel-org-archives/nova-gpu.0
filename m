Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49822439009
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471872; cv=fail; b=kO3tliaVRXkHEI2Tp8kIkijMBiY90GaOr+wPNOKrjHXokydc+R5V5LQf9tuKLgqDI7Lbf8YxT3HYEC8eMPQNkXLSd4uiHoew5NDetOs4SpTZPvJ68wSPFJ77Nh/le8p6L4lm5EYAV5oCKIdLE7kjSPtW7riC7lPkokJ0M40NutQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471872; c=relaxed/simple;
	bh=BrEKgTk2zLq+mEb/SSR00KtzuvzL+GMI71CJtunyr5c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LxWYIog5qbYlWsutILtIWTQuc1VoNdwtP4cN4jnLFlHhvaCETfR0tNMEJ64Ax5iZD4H6raKKpDVpmbrRV0qcKA7WzVQd8n8sPu7j89EeUvWBb3QRkHxlFgSbhJYc2BAYRLleo/vGXGZd3UUyHmNTwjO01J3a0HjLGsFI4nw/OxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TT/TTjWl; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TT/TTjWl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPPM1iwnVvkHRWKVLr9B3Q//wuP3biVM4NmypJgXAnKAnUtImLSG3n/gvusG4cVvc6o1AbvWKHA/9701APXSUL8M2gcrlUSWOJXWeEAIZoPQjW4x7/oT5boCXupfCOvchUped0FogL6XGHI08OLjNa1V/ytGf0BIvY+ernvG37YQ54ldNVMICNf4K+XSBuEoWvTmhmdGOSVUx/j2J0RP9ZF3LdmcQonF7PEAhkgq1tS9BJztMzZQvNRXPrKz4NXlaQdOq07T4nNH9tFDDC+GLP+sybr/hk7asuNEPoZ1MH6gCEcK4vMTmwGYKFwaxEfeesUvYSjFlM/v/kmUITrwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNgMg8bNZUeObHmn9tfQ6PyGlrqFqB50hp2x1ozBP6E=;
 b=HorWnDMDxoaGUvioUL8QdiUozYTtgGNb6STllZH5gGcPVpZp9G9Eka6gPNf1NGAas77W5DhWDXDPm4UFOZA9PE429zYan7TCyLeT3WIViF/KiYlJUmoFcperbS7t2Xp7J7N1LkbrIpXXtlO+TadCSTct0Btxy3lqYxbKDJXxwmRyl5Q9N2bBHV6y//5F98QvSae6DOjD+BA14yVpAH7fjsSbXIGRvgdzJ2S6wEF8drM0H4CLV3EY9YdkU9LtANqG47WvlrYZOIFYSTgKzsQMPt1DrGzrQKOJWNmuFpX7uuEQbao0ZXNBzFBjJoqBNi9RtFrYJezkYJZB87vrk6X8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNgMg8bNZUeObHmn9tfQ6PyGlrqFqB50hp2x1ozBP6E=;
 b=TT/TTjWloTwApKKZbnaG79OPEv+atzCOzo8CvtQww36KDbaHNS2G+WHCkWtnJK+x02vfldISWl2XuLhGQ0Dp6HT4rhm2coD0keqF88+8Cg9Bon3TY4GhIUxVTIHjTGRfSpOqCL9QwUakxL/ldUNs8LUx5B6YU/2UXD+nk9BxA79nBchle0MguFk5bWpsqUGpA2gJcSqe4rFbMihLcpMyp/B2VgXVsNAq5zn/tW57tePlNAwkbMo2xLpB1TAnYMn5dEcdiF7YhlMgW/0ZRo0o7yvnRU0rq5J8MiPDVUcJo878hdoNOqRHs6BGlawURH2yyR8q2Mic9+5v5CjbpVGPog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:31:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:31:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:24 +0900
Subject: [PATCH v13 7/9] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-7-d9f3a06939e0@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: a26f34cf-d17d-49b7-7b66-08dec1421172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ChJyTZ+fF5zpASVJe3QbPMjfco9CA3mX1VZ2FivCnrxUkksdjaDGawB7g5I0rRS58PtbUSmGI6ZeyfGxyTcRt6YC5BrdXwbFCGZ/oTL9s7WrGoun5qU0vpPr6U+bafo0FLCOwWS8mOOhiaLvEksNpyyaPbC/96OlbEucuia3W4JkkdhRTebB+vggRz8vWyYECroKQaNgb6tpOWEhbGLuwmK0MbQopRCHxpFYv58CfTpx6iMIrI6JhYjJaFhJ1/nRcKEYezVP57Os9/qJomjG0sm2ixEIj+U2Tb4nVHTzCPeBnYAOAWRhj/cZ6wPS33x2zoh78GdTY396JchPRHhSSPnPjwscHBIz8LMfwlpARvFu2ze9VUYW8aGRuLRTFC/KgjaxvirYCc15DillAgye1zvLu0T9sef6yiTtesY24R791NIttgymhz8Z35rz8+2k0bvW1XEKwNvgT4sDwNvLFyMMI8TNA5Es7GGbC4zW7npUDBMYYrJ/Dyhnq2h5znwRVCDlwHSiTq/ZVijBjowB1FRpGwzN7sYflw+j4MvBmmEnImxhmSXlOtcjGUW5i3K0UXF5/6EV1tUPSn4MpyxqHcjss8EQNmR1FtFrmSJIJEy6DNgZN52FNX1UkjoQWm41RmXSgBp7kANFxxbGmVM3RBLDKmVXtlyt/gSuKXHRxe2PKQ9BCjJMYHBGe5YJCQEa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTZmS1NPS1hCOFBhNlZYWEdDcDJtZkhJVGxsNVNHRTRmU2prYlNpakRoMGFt?=
 =?utf-8?B?Qi9wWkVQUE9HSHB6c05wcTJ3RFdBcEhzYmVLZ3dacTdZNmRtV25lMHp5WTNy?=
 =?utf-8?B?ay94ekdXK1FLbzI2cW5JVERSVE1udkZoTldOSHBBZVhmOGpJdWh3TjJja0tw?=
 =?utf-8?B?MUl4NXEyOVZrYTU4bFJTRWgra0FBcGVKcEovUXlsZk5kN3EyMXZtZUIra2Q4?=
 =?utf-8?B?T01QZmlLbW1ZZTVjSm85RzNySnA1U05SaWlyeFdDcDAzSFFQbFdJRVQ1blBh?=
 =?utf-8?B?K0lVaTUxZzN3WE1nZFhoV1c5RWRlclVJaDNWRHQxOFluQjlpcmZrQmpoSUp1?=
 =?utf-8?B?TEM5L0xwcWhodHB3NjZ0Smo4TlJhOUR6VlNvcFkwMWVMcEpYWDU5ODh0U1Er?=
 =?utf-8?B?QTdOZllQZ3JWUVhpZkdiZ2pYcnQyaDRGOC9HeE5QUjJ4NDRqN24rL1A4aDZi?=
 =?utf-8?B?T3prOWZMb3BLT0d5MVdrT0FMS3pLeFNkaUhNWE52QlErZ05pb2ZLK016RVlo?=
 =?utf-8?B?ZUpoajJvV0JUYlROd2NJbXVVL2htYThvS1NTL1VmSjRxOVFrdldiaDdOTVRv?=
 =?utf-8?B?VGRWa1hUR2lFOThxM1BnY1h1ZVF5REhKdE9JT1V4anI5b0pHUGxjYU0zSjYx?=
 =?utf-8?B?S0l2RjFuaDY4R3NtM2wxWDBFUzhnay83SmlIY2hrUHUxUkdhdUFPQWwwM2Vo?=
 =?utf-8?B?bGlYVVpoN0svMTVaOXVkUFhhVmZMYkwrUWh6QnpudnNCLzVQZStDazFzVi84?=
 =?utf-8?B?UmJBZkMvOVBYbm9KVHlqZldJbk16bjMwdFZadkpENWowb3MwQjVNY0hpdTEw?=
 =?utf-8?B?bnd6NGk1RHFkeFBEdzFzd2wyTzRZa2NSRW5KTU5MRXJRbzNoRGJpbklFTGd6?=
 =?utf-8?B?dXFIMkhRcWpXRkhYanZma2g0RllwTnhlQmNEdGhrM1BxMTZqOEE3cjFTNFBB?=
 =?utf-8?B?V0lCeUpKRThvdlF2UW9jK3hlU1RWV0xCMlp1MllraVJvWHVoNDhiNHNJZHhB?=
 =?utf-8?B?MnpZOUI1V0xFRDhNV014dno4Z1RIbFZmdFJpcGgwb05aalA5V2VaMUxSbzEw?=
 =?utf-8?B?czk4VjViak1HU0pudlVlOVh5Nk9hVjJhV1hGTVZ6SlhsQ3VDa2laVi9mTWRV?=
 =?utf-8?B?NEt3QW5KTW1TdHZMOVVYalhMeVlXS2NROUt6dEFpUlgweVlIdGJwS1JHL3dI?=
 =?utf-8?B?eGxRbCsyNlRRZk4yZE9La2xhOEpCMkl6bTNYK1VwSVpscmQ1ZXFnUEcxdFZ3?=
 =?utf-8?B?MzlQL1N6Rnk0emxkTFJsbHlSTXhwUzBNUWV6eXQrVUNuZGR5RytveTAyOTBm?=
 =?utf-8?B?RzE0U0NxRlVmdmFuUTVYb2c3RjJsZm9KL3ArVlFwSWhvNlFjSnkvSHA3Ukhj?=
 =?utf-8?B?R2NBZ0Z0SDNMRVQxQXR2ZGZ6MksxemROZ0pJem1HRVZzeVFxVW5xbmJCMXkz?=
 =?utf-8?B?eGxIVHkxay9Nb3ZyV1IzNDJwWHBURkU2bXlkWXhSeTdrd0lYQ2dsUktEZVFj?=
 =?utf-8?B?REtkeGVBZWZ1MTFuazFBZ0VGM0FDemtkcEFpQ2ptL0FJMDEwUC9tM01iUWF5?=
 =?utf-8?B?T09FMytUQkQweTM4Rm5kejVpemhHTWV2QnVXZ2ZVcTI0TWUrU2J3d1hCdnAy?=
 =?utf-8?B?WXhkc2h3REhDWldUOXNoaHlvcHQvRzFQNUs1UTJ2MGppWGhPMUpvM2N2Vk5K?=
 =?utf-8?B?WHV3Vm5GTGNmUlJxSUVZNUg0UlpPKzRtSEQvRE5jN0ZqWC9TQzN4VDVTZ1ZM?=
 =?utf-8?B?Q1hhRjgrVWNhdjgrcUUrOGhqYTZtcUVQbTlpS0VtWGxCWEhVWlZWSmpOKzRF?=
 =?utf-8?B?THo1dkcybWY5UFJzdUlPTmRDQ3Jlc1NURkFOWHFzaUhQNk9GWnpENnkwaC9k?=
 =?utf-8?B?aW9wV2lKK1BSOHZ3c0J1QlZyd3IyNy9qaUxyaHBSb01CRW1rTlRtQlhyb0FJ?=
 =?utf-8?B?ci9xbzU3RHVPdnFVUUlKNXVQdmpjM2VITkVyTXRJTEQ4MlFrdU9kNmJERWg4?=
 =?utf-8?B?dzVUeHRkNTU5Q1FTdzl6VzFpcCtKRUd5WDRrVGVSVXVnU2tUNWo2RCtOeVRI?=
 =?utf-8?B?WmRLZHBHdEJKUytUYXRIYUNRQ2I5cHYwdk9WUUlkSVJjSndOSGM1UkpaSXI0?=
 =?utf-8?B?anlJVzlUTDM3b2hzUWM5bncyR1lwdmtWdnlxRG1UK3FyalhjMnRFSHo0TlNE?=
 =?utf-8?B?bFBtMXo5eXVPQ0MxZSthYXJONDkwWWN6REpmZEFGNjVaVnFjNTgrS2pLcVB6?=
 =?utf-8?B?SXJ2MG0vaWNkc3BYcy9WekxveWtWTnZ1anBCZ2c4YWJseFU5MThrZmZGT2ZJ?=
 =?utf-8?B?MlhBZGdOenljRXV4d3BvNzEzNWdVaFhsdjIxOUdhV3EyM0N6c28xeGdmRUNr?=
 =?utf-8?Q?Hm0qzDgIk0e5HTCeREG/YWbziIZQJnKRnFGHi1MX6Tvsr?=
X-MS-Exchange-AntiSpam-MessageData-1: a2qNUdaHNs7aJQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26f34cf-d17d-49b7-7b66-08dec1421172
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:31:04.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smdNrfnbFhkFch5GBnng3m81i3gnAXLLmuejDRZSmKEPbT8tDdgTuMFapvKsdMIbp3/xrtHFhZnzmo8ckmI69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

From: John Hubbard <jhubbard@nvidia.com>

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs    |  6 +++
 drivers/gpu/nova-core/fsp.rs           |  6 +++
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 88 +++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs          |  2 +
 4 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index df6d5a382c7a..136d6b24103f 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -57,4 +57,10 @@ pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Resul
         )
         .map(|_| true)
     }
+
+    /// Returns whether the RISC-V branch privilege lockdown bit is set.
+    pub(crate) fn riscv_branch_privilege_lockdown(&self, bar: &Bar0) -> bool {
+        bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>())
+            .riscv_br_priv_lockdown()
+    }
 }
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 883ac4f8b811..872898ffe0a3 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -184,6 +184,12 @@ pub(crate) fn new(
             resume,
         })
     }
+
+    /// DMA address of the FMC boot parameters, needed after boot for lockdown
+    /// release polling.
+    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
+        self.fmc_boot_params.dma_handle()
+    }
 }
 
 /// FSP interface for Hopper/Blackwell GPUs.
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index f41f3fea15ff..def41745a30f 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -5,7 +5,9 @@
 
 use kernel::{
     device,
-    dma::Coherent, //
+    dma::Coherent,
+    io::poll::read_poll_timeout,
+    time::Delta, //
 };
 
 use crate::{
@@ -33,6 +35,86 @@
     },
 };
 
+/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branch privilege
+/// lockdown is active. The low byte varies, the upper 24 bits are fixed.
+const GSP_LOCKDOWN_PATTERN: u32 = 0xbadf_4100;
+const GSP_LOCKDOWN_MASK: u32 = 0xffff_ff00;
+
+/// GSP falcon mailbox state, used to track lockdown release status.
+struct GspMbox {
+    mbox0: u32,
+    mbox1: u32,
+}
+
+impl GspMbox {
+    /// Reads both mailboxes from the GSP falcon.
+    fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> Self {
+        Self {
+            mbox0: gsp_falcon.read_mailbox0(bar),
+            mbox1: gsp_falcon.read_mailbox1(bar),
+        }
+    }
+
+    /// Returns `true` if the lockdown pattern is present in `mbox0`.
+    fn is_locked_down(&self) -> bool {
+        (self.mbox0 & GSP_LOCKDOWN_MASK) == GSP_LOCKDOWN_PATTERN
+    }
+
+    /// Combines mailbox0 and mailbox1 into a 64-bit address.
+    fn combined_addr(&self) -> u64 {
+        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
+    }
+
+    /// Returns `true` if GSP lockdown has been released.
+    ///
+    /// Checks the lockdown pattern, validates the boot params address,
+    /// and verifies the `HWCFG2` lockdown bit is clear.
+    fn lockdown_released(
+        &self,
+        gsp_falcon: &Falcon<GspEngine>,
+        bar: &Bar0,
+        fmc_boot_params_addr: u64,
+    ) -> bool {
+        if self.is_locked_down() {
+            return false;
+        }
+
+        if self.mbox0 != 0 && self.combined_addr() != fmc_boot_params_addr {
+            return true;
+        }
+
+        !gsp_falcon.riscv_branch_privilege_lockdown(bar)
+    }
+}
+
+/// Waits for GSP lockdown to be released after FSP Chain of Trust.
+fn wait_for_gsp_lockdown_release(
+    dev: &device::Device<device::Bound>,
+    bar: &Bar0,
+    gsp_falcon: &Falcon<GspEngine>,
+    fmc_boot_params_addr: u64,
+) -> Result {
+    dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+    let mbox = read_poll_timeout(
+        || Ok(GspMbox::read(gsp_falcon, bar)),
+        |mbox| mbox.lockdown_released(gsp_falcon, bar, fmc_boot_params_addr),
+        Delta::from_millis(10),
+        Delta::from_secs(30),
+    )
+    .inspect_err(|_| {
+        dev_err!(dev, "GSP lockdown release timeout\n");
+    })?;
+
+    if mbox.mbox0 != 0 {
+        dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox.mbox0);
+        return Err(EIO);
+    }
+
+    dev_dbg!(dev, "GSP lockdown released\n");
+    Ok(())
+}
+
 struct Gh100;
 
 impl GspHal for Gh100 {
@@ -48,7 +130,7 @@ fn boot<'a>(
         chipset: Chipset,
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
-        _gsp_falcon: &'a Falcon<GspEngine>,
+        gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
@@ -64,6 +146,8 @@ fn boot<'a>(
 
         fsp.boot_fmc(dev, bar, fb_layout, &args)?;
 
+        wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, args.boot_params_dma_handle())?;
+
         Err(ENOTSUPP)
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c3c50b8d8f10..ce71772e0298 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -363,6 +363,8 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FALCON_HWCFG2(u32) @ PFalconBase + 0x000000f4 {
         /// Signal indicating that reset is completed (GA102+).
         31:31   reset_ready => bool;
+        /// RISC-V branch privilege lockdown bit.
+        13:13   riscv_br_priv_lockdown => bool;
         /// Set to 0 after memory scrubbing is completed.
         12:12   mem_scrubbing => bool;
         10:10   riscv => bool;

-- 
2.54.0

