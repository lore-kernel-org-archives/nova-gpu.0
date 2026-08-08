Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF532D73A0
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158697; cv=fail; b=V0/t87eJ2Yscr4G1PXBWkCC0CeQ7UWeL3SsBP2ev8exIdtmWiqm8QKioX+8ZDqG+H4Ds0X86evyYPXdRnPG9eTde/Qo3/uATQJ+tyJL9sxgqNiNMhm7wcPMsuE9JrFBNo/IlZT7M9iFBMKeWaztjdBcpVlzpc9HK2UJLts6xz/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158697; c=relaxed/simple;
	bh=S4s1g482o2JbyMPq7AWP/AYvOIzSFD+6Zzrqmiq1lkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YSZH7m+o+DpWKdUZiyE9QFFE8NVPSV7i8vJtbzOrb0JRTMe6681IOfPR0aLT2Nk47tV1PZWZN3SCz4ruc3BZQMMFHXDOtJPlt7UOP03p53vxGWw+bFrExm2ARSMV0XeRNdHf5sxPWrhYuFg2UDkj3pk2y8OH2MXOFhcqnWCj+5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RvQGaMwX; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RvQGaMwX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJ4s8LVJG/cIHe5BdT8zjDvGJqJNkxDHJL0bko55y49LZ0YoMovfbnlBbUcTKpPOhpeenVDxCDLjqfd4V3aYdGx2iAD5PYdEYKE9zHrgaeB6mFJZNrGgWqvZmB1elgXohe+4LwGQE2FutvQ3zf8/TrTYxYIRd7hUvyQKP7TCE4vH2sBe/Id4N30Jy6sQPNitx0WuYiV1ERvEUuINxbJCQsv7YfglwopDtVm7YDzQlREYEeya6+NF5DUamPMpA+MLDyYNCLbs6WYYRIuxlh5QF6KDslwN4uoRYnri6N6k58GV9hgkZre0BGYB19etDvjpE9Vu+Dhi0Kf5RCuogVjdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hniMuy6167k+jpTK1ZsKcQASQ4K9jlIEUZm4WnkAmA=;
 b=PcTOOvjRlOUjTOjLoJ8fz3T+GHSUHzGfh+u9Zq59VYtCFPltJfNXD9/sc6sEA3kAVbJZ9kWDWJzg3snuaJS5HtPkQIMPJz6coZ7UA54RTwugILJRfp4vTHCKNhTxQnWXSQp4YhPUt5vQe7tPmscKi8OgS6SCU+8rr25b3a5BjBoKqgFXRjGxOQYpKLL4Iu/uEqhvkauWD9V6sHrD8GFSoARijAOy40MditjuKykGA3fonr/sy9BTF9A95Hi6JX+sONE9K60LWuMQVmAHEMqd0rL7PuXxMX18pBCFXMzMru9AdwLXthT1PyaGKWEivpTrsd4HgPfRjrOK90ifI9u5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hniMuy6167k+jpTK1ZsKcQASQ4K9jlIEUZm4WnkAmA=;
 b=RvQGaMwXU4ZteM8IZOWmCPKiin4txEJ5wAoFLT13+hgZX6rGULg1ZR7V+JmEYfwl3f9IFYepQ6jbRtwcwVLEUvxmnn5wb6dMYZWooZkbXZAt990BJJJXjbnXK99YDah22JJZpxhy+Sj/6scyPRHOdG3bN5oaAwPaIXr7oSlQ5B8mXTGOdGKHfPzQtOyMUMTMBAutFTZcylqAotfuzmH47VoCsMVqJxwFAu912KjezmiKDaZ1fecNzBm8q5z6nwfjFLdThYLYg+coXcjOgbBJgV0D4/8zfu7Yh0iHgyEnnq6TQSynnb94CEwJ9QV0ZF0FFlynepTG/xix1zW8Oag8LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:26 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
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
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during probe
Date: Fri,  7 Aug 2026 20:11:06 -0700
Message-ID: <20260808031120.363869-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d84f80-4fe0-471c-41c5-08def4fabc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ntmggekv6K0Ndm4C9FG0zhJFz29yXbwVr/EylsyU9rngo3X+od+unE98+b5ExrdmbDJPYetmtXGxk1ks4D0qlHYeHq34SqAIg86sqqGrcysE7p+8za+ygoFk/DRk/kco8i/5bIOr8EMyD/iRcz4Fy2Wtvgc+mX4tCgBxVs59Qwnxzq41+V1rVnR9PqQlPGE9AWG8CfcAW6WZLjZ2hQNHwxINyiXJ+JJogG6kaWZmzClk54OXhQO4iBPLjkfsn2LKa2oulFEAZCc62Ky/iBAfcWyxxqwof/jDikD8lJFQeFxF5zo0KUp+xKLzGhhx9O4H71+Z/1FeDui3ciUeUHEVbYhB5DaUByH8nh6m/9egwaNWUR00ml8TfTsbZCwumGRaNTMqsAfMDF6Vx5KjOvEMpqJBb1VVcSimuR1tv6H7UWB/4nTjlv5hoFW+l5r/lYhMVyE+zYYFb9zvQBr0K8EOuVlc98lstEWb0q1NuW0R3zaRT7cdWgJ/YPHziHShLhSBcrZt5X0OjLlpS1EayhQ6qjR5UbRt+4hQL0ZB0EPoyJUdEwEIakeHIS5WwvNxYAbYW+w2t2cczrQ8h2Pnrs8L8G62rCjJpvjyF1sK8A+2xkBvlhVqwIpwwQYruIYvwjV+2As0UqbyhDyrxZr++aBjpefY1wNvOT6C6r3Qfqrsa2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kMirjouKp8tGRVBaut47sXBNNNWbsW4emK6m+x5uw8TCxsWdQZpBEHhpCKYH?=
 =?us-ascii?Q?uTV0ui3V4I7n3lYJOgD6U2G1KfUHLEOJ6tx4L8CvBzikLg84GT+nMhh1CM3S?=
 =?us-ascii?Q?3an2N0dBIZvAiBwKu9OKC3hZnBnU+LUZoIaXkldQEyAr8HDYWnw+7PGFXMba?=
 =?us-ascii?Q?1p00sy7c3DFZpx/NCdK+6Vu5vQ4kRFU2Zfrk+9FkVVvuSRNDIv7noqnzOol+?=
 =?us-ascii?Q?gBCoy5KH9T4NxiOmrguEZBp9QL2Q/RwYE8weGUo3Po5jPUZz9k5QyPnOP5XW?=
 =?us-ascii?Q?xardJ/tGfAxeaHjV/wiUr7GOIZBwXpB4Gl6zfn7TAx/b+Qas3uRfHK/4LLSD?=
 =?us-ascii?Q?kB5nfnPO/HmJTKB1Rfq5UtZvwewhEixD9EaEr/OMvHTbq4i1VA/wr9xUvYH6?=
 =?us-ascii?Q?DAKafKDrFostsKTDHXWWEYwRRShx5cUl0i2G1xebQGcQRDPkaQj/z7M7KXwE?=
 =?us-ascii?Q?3YTVFf2lwsCphXiXUap3lSAY+3dFZpAdXUnvvPufE4ohcfQ3+eSPK0qW4Sg1?=
 =?us-ascii?Q?OvIldRO6p8EETIIta2s0xfA/7LslW7kCxmuzZ4WGLF+m/T46F8V5vaapFh1R?=
 =?us-ascii?Q?P5BvGdrK94ZjSii2O+b4qsTP5gCTIKptCDmI+MKQLwTo/T6NfpJ8kL/p9XER?=
 =?us-ascii?Q?h9EuYSozTX8G4U5xyit2YwLSZB0DFFitDwt8kjy7qEBha4BaaFFAbHrPNzjn?=
 =?us-ascii?Q?rtu7nNpcxLfE4u9WQoY9O1VDTnK5i1I9c4V7IMmvE9hTAI8oZ0i2HPQEtyyv?=
 =?us-ascii?Q?6HI3T8Z4xMOZelVi6tn6XZOwKwZb5t3G0HeN9J/IBMSRKsVRQ8PMf0rMd0Zx?=
 =?us-ascii?Q?UBxmxxM2s9815WXUJji4sgKYpdSYDbctZtvPANLW6En2a+pl3a1ozjU5n/fj?=
 =?us-ascii?Q?JOEI0hKxFTnwnIGurAlc2kS927O8Wrkf3SQTIGXAHvqeEPiNahvB3oyCk4MP?=
 =?us-ascii?Q?t5D/BdXnDq5UAphrMGPoGjlZh8IR63o/c73L9aO3JaLcfL+h3Vu1ECnkfKUS?=
 =?us-ascii?Q?u5n21zWk+vTcd6zopT7AvVPMk7N1jJlqgO3TFWE83anDbQTJv1u+6BBPRhW8?=
 =?us-ascii?Q?cPQoLiKhEt6kQJyK3oEbZ+4XiALFkvdvIK3vVSbK3n+pwtHDyo6NLo0thgSI?=
 =?us-ascii?Q?95iO02P5QVJc6i+uHCi+nzaTQl1XB7P4bFWgrviFI7LArBYGawCwVv1UJunU?=
 =?us-ascii?Q?qrCZJ7zVGZCe0+SnlaKh3JXgMhPbTrghRAH//3t6BWPUkGOHRPwNInlnkM5w?=
 =?us-ascii?Q?Veh7inj0liy21+rxgn2H3MdKKayR8rYlXKse7zQ9mSFZxKfe1NgOVSc0GU4d?=
 =?us-ascii?Q?eM17oeAnI9loHsG30g1YQhQyZviF8jfjqUNeEwJBtkdGPawUeVuKAMuKEH34?=
 =?us-ascii?Q?0BZD6XpKbrItBWbBIFfoxaUkVQUndot+HA9sKSH17gfjcxfThamhHb5HIPlD?=
 =?us-ascii?Q?UTHUrnex0MbPD35Z2ASCoZMLIvnLeTPBFdH9asQs/bY9ZbHNyJDOSZHvkPoO?=
 =?us-ascii?Q?yLMLM3eEl7bCl1pClAvEpMJc8ssRCZ4VfZTwyPPB+XZRyVq34YG1QkoZsaTZ?=
 =?us-ascii?Q?V+NN9tuQuSBbrF/f8pFypKpiiDfhxO9oGw6QE4jnmOBnIUvDj8Tk+MQR7QAy?=
 =?us-ascii?Q?mbR+IUDLcA+jxkHRCkLnf4x/D/NMBvSbP3WBfhvm4YBQ6Ty31Fm/F2ISqSjM?=
 =?us-ascii?Q?Dm4RHUUbRDwAML7dsMM4lgFGVD+SDEr5R61d7MYwmKT3EYKMEpH+DI8JDpTc?=
 =?us-ascii?Q?1nuiee+5zw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d84f80-4fe0-471c-41c5-08def4fabc02
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:26.8020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErVaTGKje1kwVUt7ZnSkHxv8hhaJNzebuvUdXu+AaeqxhENEVfZAP6U4fBf5SZlzPP9rDn5ImxPNifhMg0Oc5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

From: Joel Fernandes <joelagnelf@nvidia.com>

Allocate a single PCI MSI interrupt vector in the probe path.

Try MSI/MSI-X first. If that fails (possible in broken VFIO setups),
fall back to INTx with a dev_warn so the issue is visible in dmesg.
The allocation is devres-managed and automatically freed on unbind.

Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |  6 ++++++
 drivers/gpu/nova-core/irq.rs       | 26 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 42a4cd7971fa..5efeba056f1b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -29,6 +29,7 @@
         Gsp,
         GspBootContext, //
     },
+    irq,
     regs,
     vgpu::VgpuManager, //
 };
@@ -386,6 +387,11 @@ pub(crate) fn new(
                 })?,
             }),
 
+            // Allocate a PCI interrupt vector.
+            _: {
+                let _irq_vector = irq::alloc_vector(pdev)?;
+            },
+
             gsp_static_info: {
                 // Obtain and display basic GPU information.
                 let info = gsp_resources.gsp.get_static_info(bar)?;
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
new file mode 100644
index 000000000000..48900c734cb6
--- /dev/null
+++ b/drivers/gpu/nova-core/irq.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::{
+    device::Bound,
+    pci::{
+        self,
+        IrqType,
+        IrqTypes, //
+    },
+    prelude::*,
+};
+
+pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::IrqVector<'_>> {
+    let msi_types = IrqTypes::default().with(IrqType::Msi).with(IrqType::MsiX);
+
+    let irq_vectors = match pdev.alloc_irq_vectors(1, 1, msi_types) {
+        Ok(vecs) => vecs,
+        Err(_) => {
+            dev_warn!(pdev.as_ref(), "MSI not available, falling back to INTx\n");
+            pdev.alloc_irq_vectors(1, 1, IrqTypes::default().with(IrqType::Intx))?
+        }
+    };
+
+    irq_vectors.vector(0)
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 35a8b1214b0e..68b5abfe494d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
+mod irq;
 mod mctp;
 #[macro_use]
 mod num;
-- 
2.55.0

