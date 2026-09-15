Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A42D472096
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505877; cv=fail; b=SD1FOU9MsPMBf6Fnea4t6zgkHLnsAaDAtaeszaHA1pnFdV9rN2C1AmJU35W66UjyCS9iqjy8VygvH+pHbNwQAlraFxB1DRTBmRpmUYjkI5QcCuTeiU4Kn+tIyZMV+40KpniPth3/SPQZc9ZhbFYcDQN9ouqw7jvT2szwgQAtReQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505877; c=relaxed/simple;
	bh=AjitKJWSs/fKI1hR5qqZEnr/4E+C7LvUaAW0W9aD2RQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmoFt1RVKQ4GNNqATzLGy40yWMltZ/vQRHjg9NgGiPRAK+7ek3J9lwO2j4iDejv8QkF50vb2i1ZGdGpkR1bhBxmv2sjyZHuYFRuLagRhR/TiyVKcxqppiT9ER3yOr/PQAQwIZolye7FRAWImofjvgSgAYGF7Pqtu/lKO0FiMw6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J1JFsV6G; arc=fail smtp.client-ip=52.101.43.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J1JFsV6G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7rp9cmaWwWjP97x7u7fhcpgf9O720Vd+Zsjb7661YFttSQG8+diBm1j+ZLHb3gDLiokqBBGd2WV3EeQ+Oq9ejpGT4eahFRCXzZBsX9NfJuYhNvD/v3QdC2tahtNaHpWCPrEDZjZrzLfjdS/IUwzW3tYq267ApW6FWWSYi+riIKLCAfbYQRBIbgEW6kCEI5wBqt4exTe0hxolW2wlnbaR2AnAI5ve/f7CUD/0agyika2CsdQI57O73B7zdeJdAQmOMKxCgjA5zFoFsPhPpZcooJAEmDiSyGAC9wC4c6iLh28UjyX2QCH1YEiHsv++56RoNKes0DZjNYTvgGq7R1tjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh56UPWXsjtfGYweC5+xsnEEBdssplJ8kHCVviVzuqQ=;
 b=D+UdC4eZYRQb5lqK3A4M91+l7LdimyjeOgTZcRZwVGu96Kl8GZYolHnKKemaePMrtIBiQduZ4aS54Lf/paLRvbDvDInElbyYWUl64ncNwoeSWbgzcbeQGY0maIjN9fP5DeKBbKpHSd6k8e08n2MiO7BkfSbShbLOjsA4rUYxb5g+ahntK4X3llMCEqW/WV+NlosGX5clfnBy6g1SdohynhspaUM+nSnfalLazo5zrV9zg4NAr6w/AwdR23nx4bTzKc1z/yrzsKC09EXX7K0SZQcqqV5cNtMAyL2Pm+2j2nULbs6wAsZ0DVunuPniCeCEjzaaRp6ZGaCGkYBmp+9tmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vh56UPWXsjtfGYweC5+xsnEEBdssplJ8kHCVviVzuqQ=;
 b=J1JFsV6GoWWXoxJEkJWEQJ9nfjls4mOj4oUcXHu6JCR921rOamNl/5N9aMuEuXraU7wtCgCtvtzPSqpqvMJpjYZnvesDpOjkq3y1h58M9JAe1WvB9r9M4GKXrS09E0WEkld548p0P+lNKr82Dh7s1qZW2LmL5UFKscerXM60HL/o3Hx3HbP2KshN1DVaSkeyXZqwT9XAWazYrwsdIbtQgvbK7bPbXnR7g5p0HOcm2tgsJSPZuqBTO6wcbQriBYrpc6lGL1ERx8BAE3Gw+Cc6pSQ20N3VBQf9FOZ+AYmSNA+ehqOCWzc016IlSHdujwwjO63csMQtQFVUAymQ5GPA7w==
Received: from CH0PR03CA0445.namprd03.prod.outlook.com (2603:10b6:610:10e::31)
 by DS2PR12MB9591.namprd12.prod.outlook.com (2603:10b6:8:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:57:46 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::27) by CH0PR03CA0445.outlook.office365.com
 (2603:10b6:610:10e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:57:46 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:25 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:24 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:17 -0700
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
	<zhiwang@kernel.org>, Peter Colberg <pcolberg@redhat.com>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 02/14] rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
Date: Tue, 15 Sep 2026 23:56:46 +0300
Message-ID: <20260915205659.76841-3-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|DS2PR12MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 104f2caa-ab28-4325-1d55-08df136bfe90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|7416014|376014|10067099003|3023799007|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Itz9FOO1ed+3zPXI2dFG4PgIaJzquPK1Ce0i/6e28MEfl+BvKOI9FFCxbaKogT4w0IxFhIrnPY+lm9otGL6djOehpzEbQXhkjcg5BbtGsdozQalhV01vjQEClMDKeQWFp2sV1o25k1TW+TC/W8C/AsFx9bZ6hJeQxDzkCIClVUbBEPhvnammnAvjKzWfJ6QXERWvKClax/gl7hTBseWjOPFs6P2tQRHWJC+r+kWbiK8c4TSW6rTXbsFkkKEGXrdF+/BUj5y7ALwy3MW7/59HNi0YoFslNnKhOBeKJusDxDpEt8nGa/AaEX017JpQSHKUcS3IscbNCiiPew3boWlmMcPIKqnwBuadzGA8CKNr8B1/y468LakwOmV8yQWu37EsyMLjk7mJDLwlCunKOUvlzEZUOfuyNQTtH9em+yvLMwsyBa/XzyGIJp65ZxxSUmI/rDGK4bmLy5KZXCj/8g7n+X9lMIQ3727yyq5khoRn3WRtDfVvGdep1ZW8ffQxyEVcStyIyaVGo13F91b89WsHAHK9W7rThL7A8dW4kchEgfnIirM3wsGED13rm4Ei7xmhlRh+R+waghKi3RTegA502bcwOSoE4hkg2NWDRaSG8CyjlnMfg5dCGKs8SfpSINW3TNPR5TICgjHoJ0ryB7C4NYMa4jlKKNXerQW+GZgt0HYGOzmZXM1VMfpmEpPu3bjcowFm7cU1E1iPIC0YNpHmHw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(376014)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OUaGGUIO4R0k1oaV2IWwB1II8WIDMHzlPZ4nqIQ/+R2lnG1JL7dLevBQVGKoJsht2k2bGi9cmumZhozvXNEv05dHB3/jCmONl7IZMHu09XGPxG+bxtisJv3Q8KX4yFGnFumIP7odKCfExeru1sdmZv2GXqjHJTv0HnEHt5avSYval7HdkqehttFa6zTtkH2zrvsR2H9gftCYnfE7ZwOvCfgrosb/UTGjZi6GE0yZcDisFIY+fyocUPVxU5vfsVg80siiCNfho5v1zwdU38WsWHzsoJqvqlVo3oEg0HO4dOmUONsqg2BGZ6uStzeClH2biXjG+wLkrjh/1cBfLwWjBc3dGNdAuAJGvP2L+zq0tv6mF8r2WVFfaQ+KcmSG8cs33/eUxJ2+yr7Y+XrUn5z6A3rlZdj5LFT0WaeJWY43i+k8516vZacLD5Uo3yOzUKru
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:57:46.0775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104f2caa-ab28-4325-1d55-08df136bfe90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9591

From: Peter Colberg <pcolberg@redhat.com>

Add methods to enable and disable the Single Root I/O Virtualization
(SR-IOV) capability for a PCI device. The wrapped C methods take care
of validating whether the device is a Physical Function (PF), whether
SR-IOV is currently disabled (or enabled), and whether the number of
requested VFs does not exceed the total number of supported VFs.

Set the flag managed_sriov to always disable SR-IOV when a Rust PCI
driver is unbound from a PF device. This ensures that when a Virtual
Function (VF) is bound to a driver, the corresponding Physical Function
(PF) is bound to a driver, too, which is a prerequisite for exposing a
safe Rust API that allows a VF driver to obtain the PF device for a VF
device and subsequently access the private data of the PF driver.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 rust/kernel/pci.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 641f2000eb52..63fd8167e4ac 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -93,6 +93,7 @@ unsafe fn register(
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*pdrv.get()).managed_sriov = true;
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -506,6 +507,38 @@ pub fn set_master(&self) {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
+    /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_enable_sriov()` checks that the enable operation is valid:
+        // - the device is a Physical Function (PF),
+        // - SR-IOV is currently disabled, and
+        // - `nr_virtfn` does not exceed the total number of supported VFs.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        to_result(unsafe { bindings::pci_enable_sriov(self.as_raw(), nr_virtfn) })
+    }
+
+    /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn disable_sriov(&self) {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_disable_sriov()` checks that the disable operation is valid:
+        // - the device is a Physical Function (PF), and
+        // - SR-IOV is currently enabled.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        unsafe { bindings::pci_disable_sriov(self.as_raw()) };
+    }
 }
 
 // SAFETY: `pci::Device` is a transparent wrapper of `struct pci_dev`.
