Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A070836
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370493; cv=fail; b=YYernV4aiEOt33EqxZmfmjBwTc+KVHPKEGZXuxBbl4qny9Z6laTBz5U/IuE8q1DHQpIcmBw7tu17+Pq3CkKeWINkmhSdl2ovup167/n12vSILzTITZOsbYO7dieoO69anfavq0rqkSuJ9oXIwGqhDXUrLJDZLAfVhnEG2OIHno0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370493; c=relaxed/simple;
	bh=8fbvQf6dyBu5SqspbhTPxYO7MAnRNNWq9cagGh4CLns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UursYOdTvvljIy7F0SlZI4pJgQWVP9frt95Ak0QWASkGag9i1u1e4jiFFIQ/9sgUyNUkyA3RUuxQ4AoSoyLDoNppTJSq09s/ChpP9CJLOCGmFUAcqWeKxMAQvhSpD3BneyAjJTXrkddQ/ZrGNeLCz1ufmcHzPCi2JRbQ074Ncd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gHPCK6HS; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gHPCK6HS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkc2ERP8QdyPTPDWMOTN+c0Ov0kMJZJSNStqpLG/PRP0LEA256+7jokWX427m7Lo0KU+yzD+1GaxtpTXMd5KlR71+od3O6q7cRCrfNY4/W1XUXTekhvHLUL23NDw2/7qFgurSRgUDcuEjYLb6tZflPP1xLm5s9FAxmQtnuxsCGHZizCZB+5rJsLc3DPNV+Vce6zrT9+cSrJf6TB8JMvn8vpLAnJm9YVtFzb4MDBx+bqxBCG3SOgCKGDkjYjieXE4waVzo4sVPqpo0ag2jUNJXBlbm1/4cWudaWRCO+A7hWoiD3vbRP3Bz8bb8E5XCh3OWyda83TnJM3Bec0BTwxBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFHxoDJVFHYTv/YXqvGpiDPO9AJttVpz17ANS/jwf9s=;
 b=K2fDaKZSWJsD+txn1kM4hM4u1S9J8AIy24ou1pvnqLH67gd+B872vUbwnnV4lopPtuWMMaCu/LZFrBPhR9+Dr5GvTy+NHO3wbHxQdwjfsFVLHu6DJuEK4trr1ljFDuHpJzw7Ak5RwejZjKju0yyPKmKCAhbtPM47ciyZb7b8pDAxpkMyhmGKLFzpmYAka7tgSlpJvUZTWb1YFbR+wtM6YxnbY9Eht2cWOx5X1D0KkP19DGQcgmswIQWKfoQXoxGgmovrgh07U6MG0HVKi85oJlWyvLutMBQMC5hcIoPy9HlxSiHNT3E/1Z8lgN77MhsuNA1rOXroZy0Eal34GLgulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFHxoDJVFHYTv/YXqvGpiDPO9AJttVpz17ANS/jwf9s=;
 b=gHPCK6HSx31HM+AjteizahqVrC3/h4xGVEwg0Qf710RoL8k/3DbFpoj3cm3a+87lY0KDCJJAwo7HCAq8qNy9BzU53T3ZxE1tUCnmml57bktDReSiaqXv9F4QnO2Dl89to0Exn64rgGNo66RdFLOQh0e9LAdzpYUFs39SRPybqfQ9jqb72lC+Aiv57WxSV+xtsQuFnfl2dsdOEGG4lYmc+Djc2bNx79RBG3H7ZmfQaBWlCZu4kig6TfhiwO4lIlMDc7wocugjSDXr6ORYqzZU3j8uwfRs7546urbuGu/PcC3JOMRAHeQiMJy2jHlmlXaqUgIuK38H+qhsqxbFT+HhGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:18 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v12 04/22] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Mon,  1 Jun 2026 20:20:52 -0700
Message-ID: <20260602032111.224790-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 4753b388-8cfe-4939-ffff-08dec056032f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	40It2aRxu4IxQyc4o/DL0WcYp8jAu6FvxP3qHaj2I65h4yqxKfp+f6i8sKyaj7RbXRVjLUMfWCQb3BtKX5k3m+6dUgPd/ApNmNP9HJEMRSqL93AZNY/wnykwCeHik+66p98sYx208Eo3DwZnDf/a1ZVIh9JCsj5slF86pik6NtWXL/03bvqVN122Cmd8z579/h1pg61gm+MsSPLfwNx5spbkYYIi8QaRN1lxurc6rnlW6ifYOBNxr8lVQ/s0BYkanZVOYsQY+E1COYAJ0d8qohkKEto0OhW5kBcv5jtJHVKdLjdiT8E0uLx2mbbAyAKfckXiZjKFui2OUYfSVQkCDkJbrYcl/sAo1C0JfaUFneLByCbwCixIlSkxyQfeYlawWMXUrdB6045enVS6PBiXMi0TLOkrVxTII7bEPVUc1IzfxZtSJ45GFiZayI5+/kdgOoYDZftWFaUFdVFlorEbvnBB65jYYfOcuAExNfocFo7hHgTelctuTENBN3+0drLflqitA9qeUEPjOCwF/Uoj8FpHDu/vlCWy6LnvUjA/qQgCaj6NrVuvW0plrhgwFJbPBnrU61CDkNdSiLA6PvcM+qEkwMRjX6B1flK8gaxYEEgZviOnbr3ymh2zqmYDy3XprsxgX4AmTIk+/SwESaV49KLSf3mMd+vZRKFpVYz2T0LPZr4cUuxnzNVL+BcS3tDI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0A3+ppm3fv3AkwojxwU3tNtsuxUitb9jtXv6At3rJLPxfX0c6JzanA+ALNM?=
 =?us-ascii?Q?yvsRDizr6z1iuLyAWnKrWnd1so7eCLehlPsMkS8XgNNz0ZKKqIx4o+5eNFyc?=
 =?us-ascii?Q?+EjQKVo3beKJhpq99+4MTEct7Q8mPcB3djIgEW0axnC+YIz29KsgUpyqGwbo?=
 =?us-ascii?Q?puFsxERCupFnkwRcLto4qwSsvV8/LAL6kas3VrhnMzFSiEA3HGCQPMxskqyl?=
 =?us-ascii?Q?gwQ4AM+LusfD16+XVsdslYQK30nCg7r/hja9Z9KLTB6TQEEk/QDMgp/TOv98?=
 =?us-ascii?Q?3pN9XdSmHmsWTLqhs3oGhWu6MVGOAl+FIdlv5prVLF6x8es+VcgNk0KHgxJS?=
 =?us-ascii?Q?lDVwS5Vaq93u166P0PjCisMfFG1weJxCrNjeUiA+/8++UrwmGImWxwQzlgjZ?=
 =?us-ascii?Q?zApsChaWuewl3x5oTEkechvybMTU0v3U61lET1jojI5fIiq4TSt50ZKU5c+N?=
 =?us-ascii?Q?at8s7jHp0nk8Z5w7/Q/F16yVBRMrwHaw3ChjqYF23BnflU5k/dvtO1hewKS9?=
 =?us-ascii?Q?PpQR/XRIoZs57GXD9/ieZPIRACzYCcKi0otJhOC62wWlpePmo3ieViXqUe/Z?=
 =?us-ascii?Q?qbRfQIEuPO14VLZ5EjeBdaKXd2Cm3QX4qKkEGdDUAQNnTyo/jdUihKZhBBcX?=
 =?us-ascii?Q?PLySf8XdmXYUYVMyORWEqoS+FBdf6qas/GW9pQgDlK4vQLwtRO5RM9AjDw18?=
 =?us-ascii?Q?S5vtPQpyofIw4IUFBx6VR9buMhF/b3OeZyRCnNSMd9tpzif+uI0/QCv7TuUF?=
 =?us-ascii?Q?fOVI9LJ0uqhCufnhd+by7bcAqP9qk4z8sHjCnqDTxYfB4qVYse/lRASDcdpq?=
 =?us-ascii?Q?+9SNzbMXkMteFe92licAyeU7fLm2AKhLbs2Si7D2+yIfLN8VSPbeuHehKTHa?=
 =?us-ascii?Q?zpUP6DM+MaYlzlP2dA4IaK6usschGxy77fUc/iIU3lAVy0UdOfkSJ31+GlPd?=
 =?us-ascii?Q?1emwEXePdtto9y83yHiiNbIL8Wc44jZQj/j1xNfe8DCMwNk7R/Lf1fl0HNNB?=
 =?us-ascii?Q?kdqKwv3cfRoaElOUHJr690gsZE2M6fBCtxmpoDLgDxLNT5yRhTkfmoBpxcwx?=
 =?us-ascii?Q?72Gw0yN/CHamI3BrkOV6aYDVYUNg+1Qsz6vGhhUFWD08WblCX5IPYowvWhoq?=
 =?us-ascii?Q?8FCnlZ0ORBRRUCjNgX2jNQZGqm+xY5vAuWFHfk6BY8ZhYx5jb9FCpbXRPyU6?=
 =?us-ascii?Q?Lcdi+TNvdXrcg83JLx2EwG28pNpBVNNw8R2X2iY64pcpv+o4Eh0SI8dp1Ohg?=
 =?us-ascii?Q?vkz1a6LCqhCvxZpNK5YdekXkrxHmZsx1SEeCZ1w35wVbNIXbvnG1WBFiIQHy?=
 =?us-ascii?Q?SbcNqpF+tCD/ZxXT2DOCYynOdWYJ51ku5JZwzXc97FYgT1AA1so0jvTp/86J?=
 =?us-ascii?Q?+qLdGg4A1VVNGHLSBj/W4kUv7nRxr52wr+KeU80cC+OW8FKZD+VYjLg05tH1?=
 =?us-ascii?Q?0BujtnowrnasDqCEFj5jzrGTUFtQug9I3P34l+wNlH8VS3cyoWLvuAFJGY9f?=
 =?us-ascii?Q?HZsEi0aX24wX+r6IR5TFbG47x165U5eHbMFgHO9ewyXU0A5VEkUDXPNbb/qP?=
 =?us-ascii?Q?ZKDRDcqVcG7qBzLRaydO0tRhsqTAKMUHE2hOCMLlWyjv04Re9e8RwPwlM+vs?=
 =?us-ascii?Q?6R0E5iTHVO71YxJ7monvHF+Wd9Y4AaRbRtZi1E48eB8PVyXA7KzSInV1I2Zv?=
 =?us-ascii?Q?ZHE54esL/5sMn5NesiWsvD/tDBm0jeK6bSJ0490nIc/Gd3798WvZ/oQkxJnD?=
 =?us-ascii?Q?9Oo2a2qFyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4753b388-8cfe-4939-ffff-08dec056032f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:18.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llxsrdNPdb0LtVQQsPqAXsi5ttps6JuvxdIgd1qcwPf/gjpCWZ46qfjktaAKiwZ769kjdIu5+uJ09aIxHXUUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Hopper and Blackwell need a larger non-WPR heap than the 1 MiB that
earlier architectures use. Hopper and Blackwell GB10x need 2 MiB, while
Blackwell GB20x needs 2 MiB + 128 KiB. These sizes diverge by family,
so give Hopper and each Blackwell family its own framebuffer HAL and
select the non-WPR heap size per chipset family.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |  5 ++-
 drivers/gpu/nova-core/fb/hal.rs       | 11 ++++--
 drivers/gpu/nova-core/fb/hal/ga100.rs |  4 +++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 +++
 drivers/gpu/nova-core/fb/hal/gb100.rs |  9 +++--
 drivers/gpu/nova-core/fb/hal/gb202.rs | 52 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 50 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs |  8 +++++
 8 files changed, 136 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index d7a4dc944131..0aaee718c2c3 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -252,9 +252,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = u64::SZ_1M;
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = u64::from(hal.non_wpr_heap_size());
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index b45784ad5f2e..be9e75f990f0 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -14,6 +14,8 @@
 mod ga100;
 mod ga102;
 mod gb100;
+mod gb202;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -34,6 +36,9 @@ pub(crate) trait FbHal {
     /// Returns the amount of VRAM to reserve for the PMU.
     fn pmu_reserved_size(&self) -> u32;
 
+    /// Returns the non-WPR heap size for this chipset, in bytes.
+    fn non_wpr_heap_size(&self) -> u32;
+
     /// Returns the FRTS size, in bytes.
     fn frts_size(&self) -> u64;
 }
@@ -43,7 +48,9 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere | Architecture::Ada | Architecture::Hopper => ga102::GA102_HAL,
-        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::BlackwellGB10x => gb100::GB100_HAL,
+        Architecture::BlackwellGB20x => gb202::GB202_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 0f5132aa9c31..af95f1bdd273 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -72,6 +72,10 @@ fn pmu_reserved_size(&self) -> u32 {
         super::tu102::pmu_reserved_size_tu102()
     }
 
+    fn non_wpr_heap_size(&self) -> u32 {
+        super::tu102::non_wpr_heap_size_tu102()
+    }
+
     // GA100 is a special case where its FRTS region exists, but is empty.  We
     // return a size of 0 because we still need to record where the region starts.
     fn frts_size(&self) -> u64 {
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 17a2fef1ad44..e06dbb08349e 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -41,6 +41,10 @@ fn pmu_reserved_size(&self) -> u32 {
         super::tu102::pmu_reserved_size_tu102()
     }
 
+    fn non_wpr_heap_size(&self) -> u32 {
+        super::tu102::non_wpr_heap_size_tu102()
+    }
+
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index c78027c26a9e..8d63350abf8a 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-//! Blackwell framebuffer HAL.
+//! Blackwell GB10x framebuffer HAL.
 
 use kernel::{
     prelude::*,
@@ -20,7 +20,7 @@
 
 struct Gb100;
 
-const fn pmu_reserved_size_gb100() -> u32 {
+pub(super) const fn pmu_reserved_size_gb100() -> u32 {
     usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
     )
 }
@@ -48,6 +48,11 @@ fn pmu_reserved_size(&self) -> u32 {
         pmu_reserved_size_gb100()
     }
 
+    fn non_wpr_heap_size(&self) -> u32 {
+        // Non-WPR heap for GB10x (see Open RM: kgspGetNonWprHeapSize, GB100/GB102).
+        u32::SZ_2M
+    }
+
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
new file mode 100644
index 000000000000..542c1d7429e9
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Blackwell GB20x framebuffer HAL.
+
+use kernel::{
+    prelude::*,
+    sizes::SizeConstants, //
+};
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb202;
+
+impl FbHal for Gb202 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn pmu_reserved_size(&self) -> u32 {
+        super::gb100::pmu_reserved_size_gb100()
+    }
+
+    fn non_wpr_heap_size(&self) -> u32 {
+        // Non-WPR heap for GB20x (see Open RM: kgspGetNonWprHeapSize, GB202+).
+        u32::SZ_2M + u32::SZ_128K
+    }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FbHal = &GB202;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..8f79c72b1823
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::{
+    prelude::*,
+    sizes::SizeConstants, //
+};
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn pmu_reserved_size(&self) -> u32 {
+        super::tu102::pmu_reserved_size_tu102()
+    }
+
+    fn non_wpr_heap_size(&self) -> u32 {
+        // Non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
+        u32::SZ_2M
+    }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 1755bbc27866..62d9357987f7 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -44,6 +44,10 @@ pub(super) const fn pmu_reserved_size_tu102() -> u32 {
     0
 }
 
+pub(super) const fn non_wpr_heap_size_tu102() -> u32 {
+    u32::SZ_1M
+}
+
 pub(super) const fn frts_size_tu102() -> u64 {
     u64::SZ_1M
 }
@@ -71,6 +75,10 @@ fn pmu_reserved_size(&self) -> u32 {
         pmu_reserved_size_tu102()
     }
 
+    fn non_wpr_heap_size(&self) -> u32 {
+        non_wpr_heap_size_tu102()
+    }
+
     fn frts_size(&self) -> u64 {
         frts_size_tu102()
     }
-- 
2.54.0

