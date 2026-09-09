Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480522D8762
	for <nova-gpu@lists.linux.dev>; Wed,  9 Sep 2026 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926411; cv=fail; b=MHgpwIFcPe8rJn9HoNHo0EQ18GacCs58Anny1pBUAB3p1Udo+af+6h1pAtpQmnDBz0RRJrg2JUKnxQ6geSZhLvpaDeowLy447+dJuMIh318AA6cxLalfvbJ+lIUnreQo+0Sdc+DrP2ptV1v+1ua3lY/L1uy4jEhcoBLe6vcWTKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926411; c=relaxed/simple;
	bh=B9udrx+Eu/wdDgHz7Jy2a0erhwpZ+2R3Wgos7UPa8VQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a9EkMuKbCXhhhOKFu7cA5Bl7qkadGJkC8xPYbXTv6FCb0FiqjjGMg20UQGtrdD8YI3b0i+VSJiizJCwy9O3Ecdr/azJaHugMINMMNO13druA/cG4qtaXDbWc4PdgQPlZxYCxUq4/ljPrmil3SFM9GACGE6PwEu3Qeg3KOAAXa3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h+h2Tyuc; arc=fail smtp.client-ip=40.107.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h+h2Tyuc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3t6RgffyrgDsTUPPqIrGIwjQv671YneQFYAVOb49buB+7uDiPeSJSk4lQCUSe023OoA7IH9bC4qaSO/xQuQKRWF/WpZD1h9x1XMMTwtYNgZae2KjfnK0a3vhj58d0WzqZMUB6QM5uRTx1nZlQ0Ax6be5lbYEVigOEAjSRidbM5OtAA/aMuQn8T7+odkq7tJT93BwCWfvglFl4SY/AdOfmXtBlkhD5fWXx9i/XFBYLa8BdueP+h2paC3ej7yMPV0DFVWiagwwYpAsp46x7bAteZ9buTGGqdCrjY6oScqbfNAIv4iARg1xx0Ap28kCJ7Nu8VGA9KifD71ZGdMId2Sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMUmfNIdwkun3p2fu/8VzvsJYUV7eIu5MgcHJGCq4M=;
 b=AKq7HD3TD/jtVeDZ5yu0vvW3fS/645JW1CZCy+VmgejlNqEMJXQLoRRsFQ2pCGUslsSiN7QplFb+xvO/wRTR5pe3xk5l2Spiiil2impSBAm5H+3BwFhwJPRycN7lV3fP4p8obQXHf0AA8x5lDSM6Nk8RYZPDzQMLhki1bY8ZlTCxoqQOsVqAfjbGWJiHfjVN0BCjtzMfkuy4xOF6nq9ADYJmOs52cPb7+tajjQ4hqGUTAyOZ8tODrHAJmlJ3EoydcCAHAWd9UyJv84hIPHAeDWMeqUnEAuWsXYzyNTGcylj4vmGzfu7RRK636LiNxZNBsS8+YW1YAtSkdric2kQO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMUmfNIdwkun3p2fu/8VzvsJYUV7eIu5MgcHJGCq4M=;
 b=h+h2Tyuc4Su0DP7kyqWs9zPrsXyQ9xUCFJ9muils6BeJ30ggDZdsAybqufJs9BtzHzKV2v7wKHU98djxFfzOcmtAITBxV9jgac1eoATXnq5XHaFpXNu3hSGw6KV+QYfkRQWjMMfoSs2XB8of1qGiru/ZRfjhJpknkMGovQNTZZBfhhusRB0rxGE/CCdhZfkku3w+sO25HvE5GoWB/M/GbH4XFJOZBpn/0lThroPAgV0TL1Nx0Jln8LCBFcmsXosHET7OrzsqUDzMp2yD8AynrP7Ljd0fDoZRxgwzZR+J8PCYhvzn9O4Jg79fXBmCzQfImLk3VntkOiqa7ReIdoUS1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB699018.namprd12.prod.outlook.com (2603:10b6:806:510::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 04:00:06 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 04:00:06 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 09 Sep 2026 12:59:41 +0900
Subject: [PATCH 03/16] gpu: nova-core: mm: Add common types for all page
 table formats
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-mmrebase-v1-3-8dd5d4225d2e@nvidia.com>
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA3PR12MB699018:EE_
X-MS-Office365-Filtering-Correlation-Id: f288ae5e-60f5-4d82-0428-08df0e26d577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m4MdYnAoMSgV0vioB4UOga9NMSSMqkXHe8PYLM5XUmJaKM0iXiRK9b5p0+M9YFdSVV2SVMZnmT98M5f+1Vu9jrPwe7pUzN2COKWCiDTONwH51D75bbC9MJv0Pj9aw7AZzbGoCRcsnqkMQesBBsOsIa/FMFFL+viVNyZXXgSNrsrZo8rGx898sAYc3RgtZ462szE7sIdBQ80//Tjt3hK4s0ryX376gcUAcIiolfYACqrMYbloUHIR8gd3EupTZHIziiPBQAIvkba15shqI/M0xRnneiN+Ksuy2UnqovPJNXuLnAEZcBHbjXdZMjN/u7FMPVQvqMVbvjO/AnK7MD5yIWXsveAohX4UggfzeGjMNqsUfGe8WD8edmVvtzmlNijTcitb9TSxqgw5PaMZ7YuCZC3zwLfYhpCPtHPqlkSN6rX73Q0uXG2zuGn0Nik6gsLNeC4/ZXMDN9+eE4tSm3ovUFk43dvANdUP4kHHupJNM1g3mnKZBrruYxN/E/24OmbK9O2zZ97TeNHW7ihLM20mB1G76n3PnPIGiu4xZ8ddFChKIiT9F9C3R/ZFWjRsHmuAcRBErRU/wTBPkw50G0fImzR3mpNFCCnkVl7Dbmk+gzvuWcZ2/MZtOS8Soc86BO+Hw5WiYxLPNUO/FwjG5jUam22VSw8NJmAGsgpVV45e+2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akFwcmhQZ3NjWFVSMzlaVWlkSUJGd1hpOThLVXBneitJY2RlYnQxalFmMGxy?=
 =?utf-8?B?VzB1NGMvOE8wL05taTROYjIxdk01alZrN0RNMFp6VmFWbFo0Z1UxMHcxRFk3?=
 =?utf-8?B?SzRJNWd5RU9BRzBoM2RJK0czZkRqY01JQnAvWlJEVVRQaXlrSzJ0OUkzbXJ0?=
 =?utf-8?B?Q3RjTys2RnpzUVhrQ1QwMnFLRDVLY2RWMnRnc0pYYmtzdU94TnRWYkNXaG82?=
 =?utf-8?B?RGNMQVp6U0xCaXNCeEdoR21PN0FLTkoxdFRTcEVKeGU2cWVRTUEzbUpHMDhv?=
 =?utf-8?B?Vzhuc1U0dnBOUXJGOGZSUU0yUVpjNjVkTHRxbmpqTVRxVm00QnE2SjhqRkRu?=
 =?utf-8?B?WVlTcWt1eDVFbk5HNU10a05ubS83N3hCeVJLOSs5U3BoLy9YRTkwM0QxcEl4?=
 =?utf-8?B?aHYrNUVQaEkzR0g1aUE5d1FoNHZiQmcvMzBPOEJzbFNnSXpwYUlBMTJZT1gy?=
 =?utf-8?B?WGtqZjcwZFByc1ZlbVl6SnR5djE1blcrUTlyaWtFcWJlN0lGYUNMeFNybWEx?=
 =?utf-8?B?MmJPMmd6ZFEvOGxFblpRR2NyMGsvYmJ5czFIVTFpMDdsSGJrWHhFL0h1dlJs?=
 =?utf-8?B?aU1nZktpTXRaRFoxdlMvcWZWc1ozWTZ5dU1wcndpQy82UjRoNDcxaDY2UC9u?=
 =?utf-8?B?UEpXTE5mU2dHRmp1U2Jwb0RDQ1c0QmtBVXZyQmNLUWN4bzBhN2xkb3pxY01a?=
 =?utf-8?B?dFA5Wmk0RHhXNXo0bmR1dzZ1VWVqRk96bmNKdmxYMkFaampjOEJOUzBtRlJK?=
 =?utf-8?B?SWpKSG02MzB0WXkzdFk3bDR6aXQyY05LSHVHVEE0VVA2T01jUUJFUlJ4bzhl?=
 =?utf-8?B?MTF0dVExcERVNmdxdTdETDYxY0EyZS83V3RVZ1MvNnlieG0vdk5mUVVnVzlq?=
 =?utf-8?B?dUVqM3prRHpOWnhhTk1iT0RNbkR5QmYwVW5sR0Z0TExVQ1c4djVtSEZmSG90?=
 =?utf-8?B?bSt3ZHRSbndmZ1ZUdFV0OWlKZW4zc0hTSlZQbUYvL3dkcCt6UUpLRmlJa0pi?=
 =?utf-8?B?bnJWZ3lEQU5jcEViZWovUlZ3R3dTR0lNdnpyTFd5SEJQS0E1QnlFZjA5ZTVD?=
 =?utf-8?B?dytMcEF2YlY3V2dtRkMzdTJMSFNDYU1qVnp0RTh0VjlmYUZJcktISjVBeUMr?=
 =?utf-8?B?SFZpNStYcnJqTTdTWDJET0NGN3h3KzRaWVlianBkNU5scElqS1c5QnVDN2xM?=
 =?utf-8?B?alF6dE82WGdZSnBzMnhhK0l2bG40TWpkUlBKT1k0ZmFxSVY5aXhCaVFTYUZz?=
 =?utf-8?B?Tk5ERFYxeG5ISVZwOTJ4RFdqdFpXclkwcDhlMkJyWldvYjFrWVBEZG9HTFZh?=
 =?utf-8?B?VUxjQzJXR3U0eVRWaVVKSDU2K2RDanNQVisya0lDREY3U1NHTVZDUHdUNTVs?=
 =?utf-8?B?N1BoZnFSRmlid21vaUlpOWM2Y0UzS3diSVVoeXQvbkFlNm16QzlucllFU3Jp?=
 =?utf-8?B?NGtxclR0NmJYM2RSc3ZLRkJ2MXo3ZThKMy92R1Q5RlpEdFNIbVRISnQ2SWdF?=
 =?utf-8?B?aHhpTkducjdyNXBCbnF5d1hQaWc2aHArcU9jV3pzNzROcW82MUtRSnVMbzVL?=
 =?utf-8?B?ZE5SRWhqWHV6aVkraTJlTjdqdU1wclhacEpRZDUxZkdaa1BIa3ZuN0w1YnQw?=
 =?utf-8?B?SStFNkNvK0ZUREpuNnBxU3h4MTk2TUQwbHhyVy9nY3RJTmlxTjM5bmIzWGlH?=
 =?utf-8?B?NGIwdlJLSFlUWWNuQXZ6QmpLNVBxMWhwRmJSc2Zub1lGY3N5UkN4c2d2TmVN?=
 =?utf-8?B?R3NJLzVmVE8zRHRyQS9QTWVadzRBa2M5Vkwxb092TjlkNTNMVTJEencyODU4?=
 =?utf-8?B?Z0cyM0hVdGJVZGRsalpjcG41TERDNGtlSWNwaC85d0RscnpyRlZSVjVtR21v?=
 =?utf-8?B?TURCSEU4VEtBOWtKUGttRUdaakNMLzJtRnNpWlJzWEZxUUlpdzkzb0ZROWVr?=
 =?utf-8?B?QldFMUw4V3J1R0ZIM2FCTzRONVZucnExNEpWc01uWC9SbkNBdUJHYVpOTkVq?=
 =?utf-8?B?dURpTVNCZVNKbWtMd0pIZE9aWWZsK2VRcWk3bFF2S0hZT3EvUG1QaEVDWWh2?=
 =?utf-8?B?bDAxQVVhaXBlNGJFNkxHbmV0Vng1T2J3bUxjNE1pVnd4SFpQRkNKVjkyZG1a?=
 =?utf-8?B?SmdUc0c5Q1RxMCs3VmtDbVNuMm1rbG1LcG5oeW52WEdqS25mRzFXWmQ3Zzd0?=
 =?utf-8?B?b3NSTnlyeXp3TW8zanRwVEl2OXQ4L200d2pLaHMxb3ZJekNtWGNmZ1kzWFVp?=
 =?utf-8?B?elB4SDBpd05lZFU2ZHFSN0F2aGZMbi9PdU1MUnBPYWppUVFndVU0Z2ZjL2lG?=
 =?utf-8?B?WWtlaDdaNjYwSkl2MndlM2FHZW1rQm9MMm1LQUNCSTBBbTlOUi9jbEN5MndX?=
 =?utf-8?Q?mLG/ft/477KAUK/cflyvlnva1kd5YC6Cn6xIccMKLtYeD?=
X-MS-Exchange-AntiSpam-MessageData-1: yZk6VCX6dIKjJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f288ae5e-60f5-4d82-0428-08df0e26d577
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 04:00:06.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZSxIY5U9KZEhOwqY0/JE/1ohQOis2SprFBkxhc8MWDKtWeqRrajCRze2cUc6zD+gREFyxp4VHABSWxRb5lBYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB699018

From: Joel Fernandes <joelagnelf@nvidia.com>

Add common page table types shared between MMU v2 and v3. These types
are hardware-agnostic and used by both MMU versions.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs           |   1 +
 drivers/gpu/nova-core/mm/pagetable.rs | 158 ++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 202bb8f8ebed..377cc9d44702 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -61,6 +61,7 @@ macro_rules! impl_pfn_bounded {
 pub(crate) use tlb::Tlb;
 
 mod hal;
+pub(super) mod pagetable;
 mod pramin;
 mod regs;
 pub(super) mod tlb;
diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
new file mode 100644
index 000000000000..ed0f3d731c63
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Common page table types shared between MMU v2 and v3.
+//!
+//! This module provides foundational types used by both MMU versions:
+//! - Page table level hierarchy
+//! - Memory aperture types for PDEs and PTEs
+
+#![expect(dead_code)]
+
+use kernel::num::Bounded;
+
+use crate::gpu::Architecture;
+
+/// Extracts the page table index at a given level from a virtual address.
+pub(super) trait VaLevelIndex {
+    /// Return the page table index at `level` for this virtual address.
+    fn level_index(&self, level: u64) -> u64;
+}
+
+/// MMU version enumeration.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum MmuVersion {
+    /// MMU v2 for Turing/Ampere/Ada.
+    V2,
+    /// MMU v3 for Hopper and later.
+    V3,
+}
+
+impl From<Architecture> for MmuVersion {
+    fn from(arch: Architecture) -> Self {
+        match arch {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => Self::V2,
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                Self::V3
+            }
+        }
+    }
+}
+
+/// Page Table Level hierarchy for MMU v2/v3.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(super) enum PageTableLevel {
+    /// Level 0 - Page Directory Base (root).
+    Pdb,
+    /// Level 1 - Intermediate page directory.
+    L1,
+    /// Level 2 - Intermediate page directory.
+    L2,
+    /// Level 3 - Intermediate page directory or dual PDE (version-dependent).
+    L3,
+    /// Level 4 - PTE level for v2, intermediate page directory for v3.
+    L4,
+    /// Level 5 - PTE level used for MMU v3 only.
+    L5,
+}
+
+impl PageTableLevel {
+    /// Number of entries per page table (512 for 4KB pages).
+    pub(super) const ENTRIES_PER_TABLE: usize = 512;
+
+    /// Get the next level in the hierarchy.
+    pub(super) const fn next(&self) -> Option<PageTableLevel> {
+        match self {
+            Self::Pdb => Some(Self::L1),
+            Self::L1 => Some(Self::L2),
+            Self::L2 => Some(Self::L3),
+            Self::L3 => Some(Self::L4),
+            Self::L4 => Some(Self::L5),
+            Self::L5 => None,
+        }
+    }
+
+    /// Convert level to index.
+    pub(super) const fn as_index(&self) -> u64 {
+        match self {
+            Self::Pdb => 0,
+            Self::L1 => 1,
+            Self::L2 => 2,
+            Self::L3 => 3,
+            Self::L4 => 4,
+            Self::L5 => 5,
+        }
+    }
+}
+
+/// Memory aperture for Page Table Entries (`PTE`s).
+///
+/// Determines which memory region the `PTE` points to.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(super) enum AperturePte {
+    /// Local video memory (VRAM).
+    #[default]
+    VideoMemory = 0,
+    /// Peer GPU's video memory.
+    PeerMemory = 1,
+    /// System memory with cache coherence.
+    SystemCoherent = 2,
+    /// System memory without cache coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<Bounded<u64, 2>> for AperturePte {
+    fn from(val: Bounded<u64, 2>) -> Self {
+        match *val {
+            0 => Self::VideoMemory,
+            1 => Self::PeerMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::VideoMemory,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePte> for Bounded<u64, 2> {
+    fn from(val: AperturePte) -> Self {
+        Bounded::from_expr(val as u64 & 0x3)
+    }
+}
+
+/// Memory aperture for Page Directory Entries (`PDE`s).
+///
+/// Note: For `PDE`s, `Invalid` (0) means the entry is not valid.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(super) enum AperturePde {
+    /// Invalid/unused entry.
+    #[default]
+    Invalid = 0,
+    /// Page table is in video memory.
+    VideoMemory = 1,
+    /// Page table is in system memory with coherence.
+    SystemCoherent = 2,
+    /// Page table is in system memory without coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<Bounded<u64, 2>> for AperturePde {
+    fn from(val: Bounded<u64, 2>) -> Self {
+        match *val {
+            1 => Self::VideoMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::Invalid,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePde> for Bounded<u64, 2> {
+    fn from(val: AperturePde) -> Self {
+        Bounded::from_expr(val as u64 & 0x3)
+    }
+}

-- 
2.55.0

