Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB13C343C
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111576; cv=fail; b=pkXsNvhbqrietQgs3INC18RIgUbAHPsm6H9k0f38pYmqRnsyH4t9BhoLechJClQxlkLr1e31PKwSf2KXAx9eVJ4dEntn0coEySIVj6YC94F9qkPwYQkK2NI+O5uNjBSyhAkJM+n+YC6bIfaaxfggzBj9sLFskZIv0l9rsvpcZX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111576; c=relaxed/simple;
	bh=ov2NRaTz1m3OmBp8Q7w4DZYL32FlOnlYYqDHvlj+4oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQZinQtlfaCJ+MZgMZQYUkdhBvpHFUM6LGDYAq3l4ScbbZV+jMv4j2KiXfcar+EaLKaNY2at7v6TiSnFdKjeMODml9/Z1B9VtOWwPOvH1gC/eDSM2rZhOEdovCpywDjHYhY1lWJlMzPDnVPf62L0m5paJ2+uBtt25XLNfBiIAiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d/cLLsbk; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d/cLLsbk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh9BCaEXMEOH5G4ivQA/DC03dvOT4MH4UjsBvSNo9LmcazH9tL4m1exBoFtlBjPsNzREtDiWtpPHSfz5pYavr9lxh2XMbL+prHNtgRq9vDzKLaS2dMRUW785haG6ZO97dlmkL2YK/+15mBIeIAycv3IazafKxXND1SxNMDklH/0p1gw5U01jQAF6FiXYKEdBp0d23XNaLU/gsXpo8LiUOkaFulA0d3UyhRFhTI5UsM8tFarT2zDzclEvAU2mrCv/KCq9LiAFwXDNEPIcah20W7N4sMq/bwv9ssE9C1R2tC2nsonCkqXFO/xwQQN7DIMet7iN91iPsDvX7JALcwgOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lopC39sIdG/rbtmB0jbGdjGvuabkFeNiiq5tJvoEJYI=;
 b=tK0TdEOL8qDtWtHFrcTcMnXMxb7tJP2XCygB+Thqu+UnFLBQ83Ie/NMULUkyBCW3EtwJlSS0pHpM27otE/Z6FZzmfKRazZwVfCmDLHj5qA977yK/deSy36lChKanWzOrM72FQew7acsA7GFE25wM291Zpyu9gz+GViGhEJfIScbVoRlB2wMgJK+HMhywq3fWPz+WAynGSv23PYbjDfAf4vK5/PeSXOuauoZD05XwqvxiykH492hWLqbMgW0SNnOpMVzI/tXHVLG+Np/2LFdWYR9oODjjPKfd5LRBU/co/vRWzso0uEjAfeqEndZ7oVOju48fZY1SthSUVVrtTBMBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lopC39sIdG/rbtmB0jbGdjGvuabkFeNiiq5tJvoEJYI=;
 b=d/cLLsbkuUZcpid/6smB/ZrjTquypuV8eTgC/hk2pQKBTC5fl6mz0+2yGDdbdKLxjTtgCzxwHbLiCAmCF0CHRFvxtbPGEBnLXAqGByDaseZA+GNi43bCRs/Z6dzBy7CxLhMwy4g7rlULGP8C3RV9l2oV3w6vG8+td3DkTAXfSnHMsHKsuUWQyzB50uMJc/r3SZml2ksYr0x1Xl4+AgXuVjQutAsz4pUfmBnrR2sEiopFvTZdYqjNBWtInc2vUs5B9zWskXgavFfmWjoJwZFUfJgeRNGuBMjJfnA74m2Fp8f95JtvrzAmyKwPM4XpstBxG8daHeCNPljTy0vGomYvTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:36 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 11/27] gpu: nova-core: regs: add msgq v2 BAR0 register declarations
Date: Tue, 18 Aug 2026 20:52:04 -0700
Message-ID: <20260819035221.336390-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b60b9f-9d3d-4259-55c4-08defda54e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qUDq/w+Hcd+91NMkrYfv896TaxKOyKsXa0MjOhgX7sdgPl97gi88M0Zn3wiTdSulUx1nbLZbloDLfDGn1CG2KizLr/xrtboeVaFePyqg8pWTqyAFDobBjHq5YyTMnaKwgCMoD6G5VPr6prC36FdixTdwnbKSF0NgcbSrMJsxT1p/R57eDEFUSxwE7VmGbbshfUrQGf6emN1DSripbjnB572wUDCM/QpKDo6Sg0YmvFrSuszQpEeMvhBN6+rOWnaMYZlFiVxHknnnFx5eb+ClJohS1AbhU8oc6jlMogBOsT/d6bhiJXf14mqLRf6tNkcGME80DWFM5bRxwShpvzdFzu5blMxl1qWvmRRpgvRm336rgvX+pFex8Lkc4LLn6bGTWRE5p2i8bOopZ3Y/iwyhwo9NWDaleP6Zt8/UAk/kBcAMj+jEbWy4TXzaxM1FC+UnWrcnOpVm8AyXDBPeRhv0Gee0axS3SpE5OS0BOagGlDboVHgTPW22BN1ZZ0Aea/6ts0Bcg1a4EvOrh4I4ZeegReOxCv+d9Fud6+d0Os6dMFEVopT5wmgRn0IXyKXKCwQpEYVXuSYU9A4xb3ni3y4PbhIa2LeRpcWFev5tomdFEQI20Go6gpHa614xIzMkVq3XKTLBwLuh3IjcB7lsKXxSNvtg84G5YvcGnL7C8SD6IC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQ1vJ5iHoFWrs4RZSmtFteRUp6bEGMY0S/Ko7b3xJvvsBAb6IjM91oSHCwqv?=
 =?us-ascii?Q?v3q+2HB2q7THz60Vc35ERCWuUF7Zy0+ZyuHyhlAK2mdMWOXb3YJzdWjhN5jp?=
 =?us-ascii?Q?g62rmL3ukqWq04qNT75Vb+TUI0IvvrvXabgQaF2+32ah9IYyzxk6WJOvTQqU?=
 =?us-ascii?Q?dR7k6RtAr02+l0IEdfp3Ec5nVnFRu20vMC+5uAsn0eA902eQFsrn0WMuQffz?=
 =?us-ascii?Q?PiBPvgKdQ243XGVt5UTam4Y4/RetmvHYvufyLD4peMZ4yVgoVNMH/I0ouCUK?=
 =?us-ascii?Q?PxrL3JwVWCyoPkmYbBwL0i1Fw5KHeL2BUdV1efMpZOB74Uo5UO9J1Qz8ziIh?=
 =?us-ascii?Q?o0HMSBxs9vgy8vOTPrbaYgwvCj0MpL3XBnb3E3ghkWLRyvyqKMHthw32ftwK?=
 =?us-ascii?Q?/Xrbg/wpfmQ62Ujwk9wZzfGIfeAoM40nHdBLkWEGruHASGq40TNpm13J+jOi?=
 =?us-ascii?Q?GELa7h8MvatWHGaD4SGmuzU3ohoWNUSCltK04XMGmSFHUTUx/XKwvxR4Agh2?=
 =?us-ascii?Q?rFkc6HkvuVijr7UF4a7NRV83gcpC+rvoVIED5xM24jhO/OgWjKzSj4j7z8gh?=
 =?us-ascii?Q?ejq0hGDg732NAjdrhDJD6WIdabBg0x3rMpO/JfC/jJ/p72FKhLO0WeLQ7LG1?=
 =?us-ascii?Q?l6wRW9OapAURMHPFfdOrJbUAWyyha1Ny99mmSA51WSMonByWtwovoU8sBf1C?=
 =?us-ascii?Q?7IR0Mjm7jTQXwCZL30RXgNYwpIxTPlk32g4HJhMZIv13mnq+Dd56pCbn7fSc?=
 =?us-ascii?Q?BLzoI9Ysjt6eDYpx+puBQj3iq/yZIgbRyVg8DQkF2KWxlvswZhulnrtgLEaL?=
 =?us-ascii?Q?7N+OpjG5uEL0GrJ5TJ9PmPq8r4zgYGzU7Ra+2v35ExccP53uvacRRXVyHUou?=
 =?us-ascii?Q?jyApyt7zHOhhsqIOhXO1Sf/2tTjCpMU/VwNr1Th2zKAvbQB9vPzMFhYKCtX6?=
 =?us-ascii?Q?YbYFCNhC1UH/IvEK8ykQi62NKfdDqTAbroRNjnkLm44kxUKq07LYGJMAOooL?=
 =?us-ascii?Q?dSm6SI2H1bDho03u1NplqhHC6UoqOWulHozQqUNGO2+I1IKf6VzEv5naP1/p?=
 =?us-ascii?Q?53MmQDqXozEoWQZB7GNb3Q/apdpo565Gv9zeuW4NA6iWUqNWFieUISKCg8Va?=
 =?us-ascii?Q?yJ94wovcOa3/mSSuA8nvfOHgnDqJDf9388E2QvXU6QbMQBakOFial9/Q9/tH?=
 =?us-ascii?Q?nrkawroRjAzes+mSPvwwMh0lDJ6K3i1dtMRT9eeHOO6HtKqAU4RidMkPqld3?=
 =?us-ascii?Q?EEsKuKw8U4Q3Clwu3/90XPPGUelg8wfZGmXrxnxlhf58oiNX1e/CQFkmKCsU?=
 =?us-ascii?Q?bNe3aTrpq3rUfMPOmgPZukQ5o5b7+QbYHchVkbBxq1U3OFsP4pCcgEwkA4iC?=
 =?us-ascii?Q?wJJoz28+1lYdMkIR2/HxZC/Bma9bkzgdGNCjdx5UmOok9yyvRRdGy6YbxOhw?=
 =?us-ascii?Q?ECgYeqjsLcGc9c+M4GZlL91Z/x8+Ra9zQR2O0W5wdjsApIbNsoNIS17j10e9?=
 =?us-ascii?Q?Zmcl659qz7V7Ftf6deL/jvEyqwJItefvzfv/Y6nfqmegNKnoFdUxFhFIdylm?=
 =?us-ascii?Q?MA6FSdaLGXXSC9raaUvS2cTAoPXSRa96zKslNBy6fNR18aVB5vpD7B4HIVzd?=
 =?us-ascii?Q?EHtNoxhnqaoOrQf1w0MXsG72ZTOUR/fvmyXhioMZNJhfjHaGZztdNs5xUDJC?=
 =?us-ascii?Q?SUrQQb4cn5aFqtDfAYpyVr2x4JOy806SWujC2LQC+lxMtCWjCaOHKcaTUTYA?=
 =?us-ascii?Q?LW0rmTFeZg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b60b9f-9d3d-4259-55c4-08defda54e46
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:35.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFpaMEoIEeiX5tv+jO0H+B01bSCD+06S1SrJnVQoO1MuK9UMGhNKoLMwa5luPY0dGKimunfC9Hm1YQpuOcvmmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

Msgq v2 moves the four ring pointers out of the in-memory headers and
into BAR0. NV_PGSP_QUEUE_HEAD already exists as the v0 doorbell, so add
NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD, and NV_PGSP_MSGQ_TAIL at the
queue-0 offsets.

Nova only uses queue 0, so the registers are scalars rather than
8-element arrays. A comment records the full hardware layout for future
multi-queue work.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/regs.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
index 9a48aa87e7fb..d2e40ed13123 100644
--- a/drivers/gpu/nova-core/gsp/regs.rs
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -5,6 +5,18 @@
 use crate::regs::NV_PBUS_SW_SCRATCH;
 
 // PGSP
+//
+// The msgq v2 wire protocol replaces the in-memory ring pointers with four
+// BAR0 registers per queue:
+//
+//     NV_PGSP_QUEUE_HEAD[i] @ 0x00110c00 + i*8  (CPU TX write, doorbell)
+//     NV_PGSP_QUEUE_TAIL[i] @ 0x00110c04 + i*8  (GSP TX read)
+//     NV_PGSP_MSGQ_HEAD[i]  @ 0x00110c80 + i*8  (GSP RX write)
+//     NV_PGSP_MSGQ_TAIL[i]  @ 0x00110c84 + i*8  (CPU RX read)
+//
+// Nova only uses queue 0, so the four registers are declared as single
+// scalars at the i=0 offsets. NV_PGSP_QUEUE_HEAD is also used as the v0
+// doorbell, which is why it predates the others.
 
 register! {
     pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
@@ -12,6 +24,24 @@
     }
 }
 
+register! {
+    pub(super) NV_PGSP_QUEUE_TAIL(u32) @ 0x00110c04 {
+        31:0    address;
+    }
+}
+
+register! {
+    pub(super) NV_PGSP_MSGQ_HEAD(u32) @ 0x00110c80 {
+        31:0    address;
+    }
+}
+
+register! {
+    pub(super) NV_PGSP_MSGQ_TAIL(u32) @ 0x00110c84 {
+        31:0    address;
+    }
+}
+
 // PBUS
 
 register! {
-- 
2.55.0

