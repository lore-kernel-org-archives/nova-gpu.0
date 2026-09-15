Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E274A441C
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505958; cv=fail; b=ZFB/E+MoCcWG8tiDXteabspl8ALcDtHTzun4zjLPLHnqOCAFmEwqPy9UZTBf/M16ITvFwEvWd+jD5iSJ5jOakBswSJ7jreIv6cxFdgJtGbZt1fEGpcCDAgZPTUEmmN/N3/1quoc7sO1Wz8Ni2s6uBPn+Yibm9iEorcL+NxCTWDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505958; c=relaxed/simple;
	bh=T6+vzu2EWDk9W7ksuK5a37pL+UsFszsm1/k5CMKzALw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B33ZYhkNoshfxFoyjwoatHcmHYJ2YL7GY0E6QtYXsOZL9HiASXiX8wOEU4fAOEU5T2EPuoj6t/dUxGP+iF/zb/s96nyTeCqTKzzhz7HsClkAU8GMFMbE1Zp64xAvDLNfL3J6OLhQKgTx8U+VGeCWe/MSP7VHYHosVSv+TvasS/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tTL/JLy6; arc=fail smtp.client-ip=40.93.194.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tTL/JLy6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQ6HLswdQOSIUPmgN6OP4cDCokNTkm8svFxm023A96HIQ71Irpsi5edxXzsNXNUYbyyhZ+Iaal/Y8u2bqhB+pmqVm3y9g8K9JhCQdv4KqZTDGHQdeiFHOd42M2S4yUev9xoYokxkPlX4cMTYIPNFishe8NZT4yP4dg0pSUbuUyuu8R+W/hhrPFYsos0GfzcwXHJ4rAadfOtkNsm/svnIKKOOasjv6RaqCUjF3o1KnUESt01ZK76xcM6Qgd3unhljTqGpqBtT7qQknVZMsFp1GpQ/ZPbqd7J02yp0Ob+HRl7xMV2MEc13DRGEstVlEdIszpNJn6CWPpK6Na3Xpggq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+7UIvDo56YK5eOI621J2q3jOzcgO3Pxxopbgs97lnU=;
 b=Ww/5SFvVaw4a5vH117HeWjGqIcfr/0QJhRxcrVpytvHJxh08ViMrzMeKVxLHnfTWkha4Xtuv3ktsPL+hJffOyEFkqtjz3NqcUDEjdGergZsBqga6LCWmLQo8oqF3MqOAPHeS+W72AjGQ7Jp0w89jXFOpd6uX7NthYZQhqLMp4GKaUrpt9ECaUZ+NpZQ9t0mjWWNF6c+gG6AmyD7FtIvXmzTCFd8fUlLdTtmn7Lr/XRLAcSh6G1TBb4x6jkkfIPl6PRy2XyZK4rYvKV7eR0CjXIdDxedwlV3TDKGv7L+SHiqx1as+qudy14XyhDbNqSIAfBZS0MDmXA0LP6V24FcM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+7UIvDo56YK5eOI621J2q3jOzcgO3Pxxopbgs97lnU=;
 b=tTL/JLy6d5uOCVjlumqYF/1VBODo15BRkKYIF147jNTbYvdYMKnZxxHtizvCc3aUVnA5VBqiu0lOLXBPgB2+Soe2EnHz/VGEIslsczAXAG6zBSxzQTv619nIBLgQ0A/l1UkbitTMbjB/mxaBc2MN6LStgm5EAS9VgSSB2RVMZKg+xIy4ulXXMw/wpeDBCneixsq1dxjT50g0ZUR8RggwWU5RX3JIbQuRYuk0gj7wGUaUGDqH3FhxOfq6Ti0dMvoBlc6Yd1iRVQCNBAA2TW8TyUPYy4A5NRaWdXr1fziBR6AqxhENY3lyMdbpawMYACteAQs7H2uAczsl0L2IPKqZBA==
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 20:59:05 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::87) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Tue, 15
 Sep 2026 20:59:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:59:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:52 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:52 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:44 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH 13/14] gpu: nova-core: publish typed SR-IOV PF data for VF drivers
Date: Tue, 15 Sep 2026 23:56:57 +0300
Message-ID: <20260915205659.76841-14-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>
References: <20260915205659.76841-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: b464ed5c-1586-4d29-898a-08df136c2d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|23010399003|36860700016|6133799003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	fubDuxQZ9rOo4uk1mNIXgBF3EB1NPUY0ht8zUF0L8T7uCaHKNXazXXptb5DNQBvENw2Bx+Tch2PdMXROhGtQHeiB4FEcyT/VDNDK20uVS98ydOX/gyIidnPR/qw8YU2f+eitaRA+TanvUZqlNF7qFhO/HqebmOHh+awpwVjHVMCgkhIQTAysbbkVCenRjxu7EG7s4otdpGbzvzpMpLmFjj4n4WKSL2320wJD/9PPU6q9sWa1fPJStTgJYFxpraB6SF0rfn1jQ+QI3wTBw1ITX6abInGAVc8frzWvfQNtiPYYo0oxVO6obb0xwZFQ68KmttTLaU3s+1PMhjIOVc8baDzVTxyXshNluNg1dM35LkILVxroOqkvNDPAQatwpGPBGhcnB2fZGBhOCRmzJkNZzWQfgiszOE1Sd01IWEZmmq+R6hAjbKslsXzuQ18o0cfXhBq1PZgHlCWw5U6D8qL3p26b12PPi+wc2I0HSIh8y/K8ZUWnpWRmSADqn55RwbNqqrvEgL3wEnACEiiJAvF9/ynL9AIL6MOtE4d0NZ1avYrB9PrBJWoQtHL3y/5JOtXP9bEkbHCeKOiDx8fVT1rcQPlEEh6WXwU4YLF5C7w5Qzg93z7t4Asu6i8w+fkH/Rm3qfGyVO65WjyEWeLxUbBDLKjnMEH1Tqn4NqdldV6Wcgj3bfVAzddDO6WtdDliMfjkDiLwR3PvcVOwbx359qjMQg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mqytFh7Pj4lDuka8hY7qkgjTAW1j+nJjWhTBevukNFmdsvhO158bd75Rq2a/RdiTWVSAn9KQlYWzsruyVDPxqm6X1AsY9C+6ZnA8JVv6bCHeqUS3ND/qtcqKHc4w8QmugpaBlrYkrH8nTpfPECO+y5jS2ZI2ixZ6kFWjMp4haNrls6IP0zfyZfEU5JNBCGwW4T3tFIcY65nwM4vfgmz5a6e3CRcpf0zM61xd0CGfYWxpoLgx6H3LH0zNW3l8JvUo2c6X6xDFEA79YWZxU9miBVMrbPzqWffVHTNn3kMuVkIFtbUyuYiW9lltDKISiG20sNujPb9VBqA9Zo0o81WiTth/Vw6axFUhNQ1gyeU6NxKmxcIpwcCupxAzoCbWjqGnJv2Q4W181Hryk0qErxsraBg3EDZFg8QGCxlh/G7VnJx80nwa8+Q/S+6GcClO1xj0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:59:05.0554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b464ed5c-1586-4d29-898a-08df136c2d81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303

Nova-core is the PF-side GPU driver, but it does not implement the PCI
callback for `sriov_numvfs`. Userspace therefore cannot enable or
disable VFs on GPUs bound to the driver, and no typed PF data is
available before a VF is created.

Embed a `VfRegistration` in the pinned `NovaCore` driver data and
publish unit data, `()`, as a typed readiness marker on SR-IOV PFs. The
registration remains inactive on conventional PCI functions and rejects
VFs, so nova-core can keep using the ordinary `pci::Driver` abstraction
with or without `CONFIG_PCI_IOV`.

Implement `sriov_configure()` using the verified PF view and pinned
driver data. Managed SR-IOV removes every VF before the inline
registration and the rest of `NovaCore` are dropped.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a5b9a50cbaca..1373417386a2 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -35,6 +35,10 @@
 
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
+    #[cfg(CONFIG_PCI_IOV)]
+    #[allow(clippy::type_complexity)]
+    #[pin]
+    _vf_registration: pci::VfRegistration<'bound, CovariantForLt!(())>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
@@ -107,10 +111,18 @@ fn probe<'bound>(
         pin_init::pin_init_scope(move || {
             dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
-            pdev.enable_device_mem()?;
-            pdev.set_master();
-
             Ok(try_pin_init!(NovaCore {
+                #[cfg(CONFIG_PCI_IOV)]
+                // SAFETY:
+                // - probe has exclusive access before SR-IOV can be enabled;
+                // - the registration is pinned in driver data and is its first field;
+                // - no other registration is created for this device; and
+                // - the PCI adapter uses managed SR-IOV.
+                _vf_registration <- unsafe { pci::VfRegistration::new(pdev, Ok(())) },
+                _: {
+                    pdev.enable_device_mem()?;
+                    pdev.set_master();
+                },
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 bar1: {
                     let bar1_idx = bar1_resource_index(pdev)?;
@@ -149,4 +161,19 @@ fn probe<'bound>(
             }))
         })
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure<'bound>(
+        dev: &'bound pci::sriov::Device<Core<'_>>,
+        _this: Pin<&Self::Data<'bound>>,
+        nr_virtfn: i32,
+    ) -> Result<i32> {
+        if nr_virtfn == 0 {
+            dev.disable_sriov();
+        } else {
+            dev.enable_sriov(nr_virtfn)?;
+        }
+
+        Ok(nr_virtfn)
+    }
 }
