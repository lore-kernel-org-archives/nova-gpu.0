Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4236604B
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405345; cv=fail; b=fzqIqpXF0+ZyCnBfQeYYA/XwDjhZ2GsMnT85YVTBZu1dmUnrwYxYlWzdsebW5GG89DfzZsVpmqX0lTEwNVP6yvYKqHgZjiqgaOlj6KcUthWrZ12bMLFOqrOhMqbA//ZDlHqz1v5ljoSFU7X0t6HzrBHzUDwxfN8GDshZSSCVvfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405345; c=relaxed/simple;
	bh=ZOuJl0OQOBWOjEcSjG1TFPmBJFkognUQLqa/hMnEZKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ety9i1F1WOixWnjzP2mceiHIhjqR+lBnHxNdQq2tiFkChuqpd2ZkV6xhmmk20x2h6j9Z+t8sFl6inDwewmFM0FDSzQ1+MpnnRBqowaE770pMghG5svNmekBuZJCHKtusn9AuIlBV6eOzJVqir5N23OtgSXuB7PU/k+2S1unzl+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uMuVAwh8; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uMuVAwh8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC9ImGJSeM6g/7XyEtgz5psvZ5Of1OwprfJICt7ZNpD+b9ilNxCkZub1WrEHwL0zMWuKE5t5PqIZFiOy6u/V3mEHRTOoZPaASmgR4wLTBUFiNFaEpDZa1yuVTiAb0WZPxY2rpSrT0W3KQgHrnRooA18JwHCPrbhYcdKLlNhX2NZMhWThXR/jHFMmcPIe+S5KR7/yBQPEl36saKP9SSuWT3TuEV5YQA0xZp2jM+5VIHOWJCrdJUaYSmCz7A0bUA1Ya1cKCtvp7TocuZdexFSPG0fOQHI1zDJ37KCh7dgjRiLm5oBjm31VmJWhSLoOBYejP9FyzvJYL4uDpqqfq0vobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL72QSUOvclsmVyZVxl5HxKLfmNaFoeORzlHE5ARtGA=;
 b=Eup9HAaWAqGx5bB0Im071rdf7Bu/pdgbp4aJgZ/78MraTqD9VVKY0PyNqdNynrNouJE1Uh5DocRu/aw3IG7DT/xtoQVS8o7JkwFvNCXU46MwBQ5y2Vw3zCkbzCs0ih5Ae0rk6nArCunHx8ndeO9KNiIC7ePgGFR6LcPUl5aYmWt8oh1X62wu7mzs+eZ4m35Wp8nTBQ8JcdL0NsqxWR6I6qneNvOLVASR86o2kvd+x4N5xM5FnzqMxys/7SxS1NT6hUjSAGH1qU4MdCEg0x+kAQWEJOKuOGGqiVdh0TJpQ6iMeT0lpmpcQ6Q9thPHxddorjx5f+gUc8U8KgzOeS7Szg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL72QSUOvclsmVyZVxl5HxKLfmNaFoeORzlHE5ARtGA=;
 b=uMuVAwh8WVB+i8LHWe/DyWnupfVAttRpu/pdxndQJ702qquAe0IzTo6lQXv3wywtdfBSJAPYnz3+qmaCywI67V+TQJ+ocmfSK3PmqUvqo4jJH+fdMLGbOjsftmLJgGBVMSS+386VBJolAN2Twy6P6eGqLYTmhdyAR14hy6D4N2o0H8aUzaXbRcc2s/NbjbDuutAl5YEocXf7p8MGboJEerMIbSyvOzPcVG4sXCAoUzMVvdm0GxM4JCzG+BH4s6/Bxu+3pyuucY95p0kE1vzYzOHzGqjNhB6YYR6E/RL7mmsnlCToAeLzqMwM/QhNrB/xN9TLvj+2Wg9OsZXLKmotYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:33 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH v3 11/14] gpu: nova-core: add the falcon interrupt status and routing registers
Date: Wed,  2 Sep 2026 20:15:10 -0700
Message-ID: <20260903031514.1515905-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ebf472-7b84-4887-bf91-08df09699c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tTKxsD84SVVVo2lpjldHqZa8qe1FHeJ/yxickgsVA4kO4tYwbGU+fFO02jiQ7SjXSwGTxThtHHVp+/XpeSv1rx+wgJhC9JhWxJRsTqhWy6rcXtOhUQVAk6HZFj17W8Meq+/6FdSuPIl6u5q54F4ywPZI4/AUVy4HiOF0drj+2RXj8LSjc0Ds3DmeuSv+V3BOEHS02ue805NV2deEWL9/qNKofXVs7oGlB9Bv/RcsF8vp8hTDGEL/7QU93XwRnHkT/LIDKln5MyhwqBulGzEK4+DNuoVF+6VOMiU2bXyQGvp1X+LxlhBbkOUYoHBTFisDaU5PvEExS2gKohvHPJVQcqiopPEipM+aEyTdrSHcZ8FLjGD3C03wdKyuHInPEaZFSqdZxnXQi5/q8mrQuhvoIqR9wpjn9kniRR9gZfORQWcJulubz0wu5Jvu2CNI3h4NMEFoG1HHAcHaVWhJ5CjI9vXfS+zKCh15p+fddwYk9v9vWqDLjV8LqcjdVSn99DxlbSKw2om526O3IU1ljKtdhiTePgo7Ec9zjQZPLuk6YL9Pj1j4grB+DimEuRHo5ouPwROOj53i7+NmlsN1UEt9b9CbHs/9G98ECqXAWoZhHkkulDWlMZOl1NM3ygGhlUeci+DnSdOXTO3f+fmKmIcOH54XYk4d3q8x5tM70Qce6Tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BT4p9ZTqmFzSMkk5/VNwhU9q6V+LtfBM+D5nXtXzrBG2PMWnRatH0/ua0dQ7?=
 =?us-ascii?Q?cKDBH93ll6NfoHS6K/m45cT2VzoaMSIN0rUTwJv3KnSdgEG0TCpd8z624JVb?=
 =?us-ascii?Q?FjDShGxeUiD3ZOJhV4MeSIZdL2uZjoiUs09hCvWFFlFLCFhRPdcevVC/nQ8+?=
 =?us-ascii?Q?ySemhxnE4fqV79O3uk3ZZjTPpPjL70vrujZCFylE181vaaJ0CnOsmsPajR0j?=
 =?us-ascii?Q?12StaqEEa+R8JxK8PpXXAlA3c1Utqi1gRekO53b8fDrGkEs5psGX1LygqN/A?=
 =?us-ascii?Q?ZCr3bFbUE3Nze6VyaIC4+epY7bJbzKvKk9UpPpNA927t2dTwktUJt7JpH4VW?=
 =?us-ascii?Q?w61VRAiNhRMSTEjF8M6ZAoyFQzN5mVlXXFbOtE4wm86yrZyRxHuOpByo+oFM?=
 =?us-ascii?Q?00ZgUUD0Lwq20Xi7E7IcVLWHqPXRoiJUxgk+XzZSh2/4Pwbr40ATvS2W5KHw?=
 =?us-ascii?Q?hsMtWybTw9HCC2w+XcnN2ZDKLFhdcd+q8ZefxWrOHy8SUkU+kJ6JMDOYBVbI?=
 =?us-ascii?Q?CmBK3aVM+QwNCaUNBfBR1IHAOcBqdMij7aZB0F+1v2D0TbdkfpY3a/yttCXg?=
 =?us-ascii?Q?6/I2qZsgVhgDFlzPFf3gLWU58YXNb4h4Dw3L5vmU1s3eWu7BW+ssYvw37+8A?=
 =?us-ascii?Q?tu7L2tqWlGi2hhHc/5q0dSEqxrXTb8RAr8Ija2Z7UH60yUZWTupkh95Zk93x?=
 =?us-ascii?Q?4WN93LMhgc6G6dIIPV2jRfDehHoiEMvR1XgTX1xN6FkJujP+2WnFMAOtqf5D?=
 =?us-ascii?Q?XgSeYNaKeAAqpCk46FdnJ4rCgGtJEEbcl+J3AWxWy0ZkxhSylrj2kQRa2IF5?=
 =?us-ascii?Q?JvCtX12KGhnHrLs+5NWMeN9/sG7meWV5p3G6+3AHeWrtp7g5wpTe6MmQZ2Dd?=
 =?us-ascii?Q?xUoVRKyzxykmsUaCg+oNz2Dk6LtoTf8vTRKthQ/8X5Ifg6TeXsfDdvSga5qw?=
 =?us-ascii?Q?D9C19FBlt6lSBn/gaWUvw+mXFnnIxqqp8LYOSuzkIN88Swn64uVWlKUEnO7L?=
 =?us-ascii?Q?Wwnn9Yu4hyGaoHWH5JATQLf/vslyFNwJS2GlXJVxI5CWeFEjSCkPfLgNUAvI?=
 =?us-ascii?Q?Q+hbzD/ILw21Dz3rvXwjhTg0lJTQHkLvuX2unapOMQHDRq+peAQlSh6Z6LWe?=
 =?us-ascii?Q?hwxEGo3ShQvqXRRmI3lFM78FILeWnFqC0Cli9IytHOMeks9S/gNH1B6HLKn5?=
 =?us-ascii?Q?F4JMtA0/21pdIdRL+YasM4O7/vMqPh6jlUMXJ3MLE0ODCljVb2HmduvzsZvt?=
 =?us-ascii?Q?ALNFTSaY+NSh2bdg6tB5M7UjDikgBCWOmpKUmaPEa6fEcXk0uiYE7cdfAVJf?=
 =?us-ascii?Q?hqzoTZN2rcXkJtGaczyy3QfOtQQWtSCq2+YIQcmhdymbAobKwBgj1a1m48S+?=
 =?us-ascii?Q?q8KNFRakA9KoHBznA2RG/uBgn4Y1yqrsM/pGliCs9VpE2E7Gqz3ReVU6KPk2?=
 =?us-ascii?Q?zq6k2dFL8ij8pbwa2gpktktSNdN6/9PYKYiMIr4HBJn0YJm3djCsI3iSjJjd?=
 =?us-ascii?Q?Wk1bsa+US0Y4LuH18sinN7fhCQ+mIKTZpZt7bX4AfCkFfv+S+MJr88rEG5m9?=
 =?us-ascii?Q?6ZoUD1PrnQq2qupCUnPEMm6/Sfqq0kTmDZFpZt29x8jCYxGyrULTkqzAOZrM?=
 =?us-ascii?Q?IN1+TR/YWt2N5ACfODjS3Sh0F7Mj6UHQxJMcSeKvchkGMnUw1+WBbkUmjr9J?=
 =?us-ascii?Q?CbYuR49TMx1wfo9ugLr5tsPYThLInamx6sbr3BpLqP8Fp65+ffUGLffcS2xu?=
 =?us-ascii?Q?CdjifMawNg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ebf472-7b84-4887-bf91-08df09699c9c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:31.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5Owa8jvwFHnPIzAK5srLtDlKhtykut1w0gidt2rQSeXaudl1klkOYwIYsvLBRg/F7H1juRwELrgQLfvxMtQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

A falcon latches every interrupt cause in IRQSTAT, whichever target the
cause is routed to. On a RISC-V falcon each cause goes either to the
core itself or to the host, and PRISCV_RISCV_IRQMASK and
PRISCV_RISCV_IRQDEST select between them. Open RM intersects the three
registers to get the causes pending for the host.

A falcon signals the interrupt tree on a transition of the causes routed
to the host, so a handler that clears the tree leaf while a cause is
still latched leaves no transition behind. INTR_RETRIGGER supplies one,
and Turing falcons do not implement it.

Add all four, ahead of the GSP event handler that reads them. GA102
moved the routing pair and GA100 kept the Turing offsets, so those two
go in per-chip register modules rather than the common one.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3422b49df7a7..502712e9c161 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -120,6 +120,14 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         4:4     halt => bool;
     }
 
+    /// Interrupt causes latched at the falcon, one bit per cause.
+    ///
+    /// A cause appears here whoever it is routed to, so a handler on the host side has to
+    /// intersect it with the routing registers to get the causes routed to the host.
+    pub(crate) NV_PFALCON_FALCON_IRQSTAT(u32) @ PFalconBase + 0x00000008 {
+        6:6     swgen0 => bool;
+    }
+
     pub(crate) NV_PFALCON_FALCON_MAILBOX0(u32) @ PFalconBase + 0x00000040 {
         31:0    value => u32;
     }
@@ -247,6 +255,18 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         0:0     reset => bool;
     }
 
+    /// Re-emits the falcon's latched interrupt causes into the interrupt tree.
+    ///
+    /// Write-only. A falcon signals the tree on a transition of the causes routed to the host, so
+    /// a handler that cleared the tree leaf while a cause was still latched has left no
+    /// transition behind, and this write supplies one. Turing falcons do not implement this
+    /// register.
+    ///
+    /// Open RM declares two elements and uses only the first.
+    pub(crate) NV_PFALCON_FALCON_INTR_RETRIGGER(u32)[2] @ PFalconBase + 0x000003e8 {
+        0:0     trigger => bool;
+    }
+
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ PFalconBase + 0x00000600 {
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
@@ -395,6 +415,29 @@ pub(crate) mod gm107 {
     }
 }
 
+pub(crate) mod tu102 {
+    use kernel::io::register;
+
+    use crate::falcon::PFalcon2Base;
+
+    // PRISCV
+    //
+    // The two registers below select which of a RISC-V falcon's interrupt causes reach the host,
+    // in the layout of `NV_PFALCON_FALCON_IRQSTAT`. GA100 uses these offsets as well.
+
+    register! {
+        /// Causes the RISC-V core enables. Read-only to the host.
+        pub(crate) NV_PRISCV_RISCV_IRQMASK(u32) @ PFalcon2Base + 0x000002b4 {
+            31:0    value => u32;
+        }
+
+        /// Causes routed to the host rather than to the RISC-V core itself.
+        pub(crate) NV_PRISCV_RISCV_IRQDEST(u32) @ PFalcon2Base + 0x000002b8 {
+            31:0    value => u32;
+        }
+    }
+}
+
 pub(crate) mod ga100 {
     use kernel::io::register;
 
@@ -407,6 +450,29 @@ pub(crate) mod ga100 {
     }
 }
 
+pub(crate) mod ga102 {
+    use kernel::io::register;
+
+    use crate::falcon::PFalcon2Base;
+
+    // PRISCV
+    //
+    // GA102 moved the two routing registers. GA100 kept the Turing offsets, so this pair covers
+    // GA102 and later rather than the whole Ampere architecture.
+
+    register! {
+        /// Causes the RISC-V core enables. Read-only to the host.
+        pub(crate) NV_PRISCV_RISCV_IRQMASK(u32) @ PFalcon2Base + 0x00000528 {
+            31:0    value => u32;
+        }
+
+        /// Causes routed to the host rather than to the RISC-V core itself.
+        pub(crate) NV_PRISCV_RISCV_IRQDEST(u32) @ PFalcon2Base + 0x0000052c {
+            31:0    value => u32;
+        }
+    }
+}
+
 pub(crate) const NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS: u32 = 0xff;
 
 pub(crate) mod gh100 {
-- 
2.55.0

