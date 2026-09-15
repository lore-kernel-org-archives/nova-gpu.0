Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6C3A4508
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505883; cv=fail; b=u1FDLnJLbumi8hkhYaomAN0lE73H4g2LiajwQ/4YFeix+eGso9r3QCyo67JXwYrn3m4d1Hrnj3hWzqyBpge8B+3led3cnFrXYIq7iUtQlHXLIVKKptb6WqG1eNCrq+w2kvvQyeP8GiHz/DoHoWpxt3O5MFN/l3Rn+z54Usqha5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505883; c=relaxed/simple;
	bh=3n6hRSwfC6nGRHYei+AzmgwIFDzjIyNOgbnR/eCYYAc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RC6CYPhzMIQlyeeqRq+bcxWQyRln2TQDAoYbV42PeWYqJyM/vn2PqvYPx4YVwPFQsRjBtjxwCu/yz/H1a3I+bXbLPtcPiwyD4K+aPnoebeHn9Zgdn03cdUjawIpdvEXBsSpr5zyEwzPhu9xzPSP5mrsxJp1flA5T/6R/LWwrUhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pWLdpI7C; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pWLdpI7C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn5zyLgZSxeMKJTBFrWFoZ5YHDIzGC1ZRL89d4rlHoFQ7pXaO0ndCVVXtwfSxIMbMgCgZitGAs5fWyfauqTd/oT22dqtF2jYmTnZYhKglvg7Y3SPlvE2dgZEZTvesjqxxlZujtk4dSDmx+WqdgkUr+9vxXdUPj6BdvEZVIZazAhr5MZPXsnSGhJqtukl1jSWy84hIdrFvrae/uEnSv4oDEEA8Jm5SXb4JdzaCeuvuosjaiE/NY5f8MomYl7Ml0peedbqQQsfw1pcM+I6oLfzsjhz6gUgzqJLokju8Xvlov6WHdhrCaZ7HRgjdtHiYXeqPIpGLLxkUlWrdQcXNq25pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY6itu5/Rp+hZTrgVIT1b3sybrtUnpU+GJ5C6gZwZc8=;
 b=fPXoVi6gn/LuXLu4EX+QbaZuWVIS5/edJwaVfNvRjoIRNzjCAKsJAVUnJSbRwyZxPfu29Kqlf+QmamizsR0P909nmRW/Dt1EXKnfleLexjupWSU+UY6DZ9u5qGXqlHd5a9RjelOm/lbW+xw+8kqGJ788DyZi+2JiTUMk75cRbTQZ5xrVduLKuos+B9VTeFiDbzRzc88isOGX5bn9kAfqXg11A6sDehp8YaShtwdOsR4yz5MRdgn/PLwA5tZ7p/PbEw8R0kNU4uHFwoSKTVFaBTSaCOP9iFsLb2+Pcsd+xA5URDTegUO4dLa3iirNDdDuA/WvLgSBDdHxSJNQW3DyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6itu5/Rp+hZTrgVIT1b3sybrtUnpU+GJ5C6gZwZc8=;
 b=pWLdpI7C3hhQhsJGywx2qx41eTP/P/e/cxbwyutj5jmOcrgp7wT/Yit25gLe/YhnjIWkm4gjSZkTaJOdoyWmG+t5haz4mA0pCRpRF85hFZsLoOCfsmhjHWSYyPRYn9O+TBnRlAh/uwIyqqvVmJyha0p8MuHH5qo8MencCEuzMH6IMxNpNbojWSmUURybSlEH93fMjkTKo8sS4bGlYgdj7n12Ftwoi1Mb/mFU1TzLZF2r0bE6uqTio8AQoqBZwk76l14K4T7QZPxU1vUH0pEi2ylTzLfuhex8izMTsFtTDsin8BYGWytxrsJnbV2kvRLgwnbXBVnfTBaLck9BYpxcxg==
Received: from CH0PR03CA0447.namprd03.prod.outlook.com (2603:10b6:610:10e::24)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 20:57:51 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::a8) by CH0PR03CA0447.outlook.office365.com
 (2603:10b6:610:10e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:57:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:57:50 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:33 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:32 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:25 -0700
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
Subject: [PATCH 03/14] rust: pci: add vtable attribute to pci::Driver trait
Date: Tue, 15 Sep 2026 23:56:47 +0300
Message-ID: <20260915205659.76841-4-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8e26f0-c92a-4faa-38f2-08df136c0164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0luX1avVtCLNsVEEP6RS9FiZ2sGtPMb1wZBOK0cADB8OFWo5D7d9WF+rdCa4BGX58G4sIL8/g2Mz1PW1PeeAvkZoR8LR8gWfPLSk2jAk16MhxNY0B1Qu/cDXdRLQ7OTyh1do8a3LcEEjeSMMDmcNWb1RC1aWCXwU4E++tK5E+7UY0+zVFUPPxZfwhbwyhPtprOVHySYaE9IVHL20gin63Fivc+7EswSKZQSEHgS0Eg2dFw3SuYEZC6I0Y4pzVjddHysbCJotmXERJpjdw+imsALJaMmmLEKRRzqKGlMFduct69eBW2HF7qmXcYh1O2CvwgH9lLDk/JXUJVlmeJuraE7zfOerUsFNAn6Bb0Mmx59HT9h4H3zbniQZAgXlUiBGgc8I4OsLPDG+bhGC95CKamCkrFTHMzp0B6lXytN05jCcehsgJjpx1BTPnTNIEJw5zEVPUNDDymRyCRIUxwN/g3S1hPecMQxEYnmfssg9MoG0UNUAVQSin73wkfeJR8nPf3ATi7m3Vlv9+FTh1ftcZMs5NIEYXJexbf6uom0iYSqp7QbDZ7GRMQVy0J5FEdqvLo8hMlkw+a5DRyM20uBQtT5i9yS9keVXhJx0Ktv125x8ioxIQwy15dm1kWBFu5EnpiGW2/rQXp9XFsbZFO7djqf9Oit1BFvWo9jzCo9oINlF5KkZ6tJa3s593J27ifbLo9LTMzfiJ3J786GLzfmUAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G2fkfTW7qK1JZOx+wTNgNcEMqLMbGlphW0eRpqD0lT74F+NLXmmBHR2hh8p4pLRRpe3jItFj+wP9hyqMkOzKdKTbLi+n8BkY/ilPJUoG2rPplls9ZarL0Pxm5beMlGHoS92FixPn1Wp+WEsjx8AYWO6IgiZdjrvyLIZqsseUFL06UI3xq4Ny4XBOkRzlpjnp8s44ztp9+N+XoWcfYXIdKA5pBKxls61xQz0nA2YEGq0ZKFhYt92kCEd2XMlaDrvczlHPrR6n2WnRNNJtGMikEFoBlf5e8F+TEMti9YmZlMoPyq0xYQ812zijbkOj4jai4jh2RCUOGHs3nMuetw4oqCW/b03IC4U+v+J/k1ujSVGT4gvmI/tMcykKU3xrgA+soqig9eSLEvI+il5DUtV8pxT4VTfT1cuXbA/N2IfRZB4FfHth1qRrTtuVT+qYvsuN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:57:50.9076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8e26f0-c92a-4faa-38f2-08df136c0164
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198

From: Peter Colberg <pcolberg@redhat.com>

Add the #[vtable] attribute to pci::Driver trait and implementations,
to prepare a subsequent patch that adds an optional bus callback
sriov_configure() to enable or disable the SR-IOV capability.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs       | 1 +
 rust/kernel/pci.rs                    | 2 ++
 samples/rust/rust_dma.rs              | 1 +
 samples/rust/rust_driver_auxiliary.rs | 1 +
 samples/rust/rust_driver_pci.rs       | 1 +
 5 files changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 1f6fe2d97cab..a5b9a50cbaca 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -94,6 +94,7 @@ pub(crate) fn bar1_resource_index(pdev: &pci::Device<Bound>) -> Result<u32> {
     ]
 );
 
+#[vtable]
 impl pci::Driver for NovaCoreDriver {
     type IdInfo = ();
     type Data<'bound> = NovaCore<'bound>;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 63fd8167e4ac..24b682d4d6da 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -282,6 +282,7 @@ macro_rules! pci_device_table {
 ///     ]
 /// );
 ///
+/// #[vtable]
 /// impl pci::Driver for MyDriver {
 ///     type IdInfo = ();
 ///     type Data<'bound> = Self;
@@ -297,6 +298,7 @@ macro_rules! pci_device_table {
 ///```
 /// Drivers must implement this trait in order to get a PCI driver registered. Please refer to the
 /// `Adapter` documentation for an example.
+#[vtable]
 pub trait Driver {
     /// The type holding information about each device id supported by the driver.
     // TODO: Use `associated_type_defaults` once stabilized:
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..804d55a63005 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -69,6 +69,7 @@ unsafe impl kernel::transmute::FromBytes for MyStruct {}
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     type Data<'bound> = DmaSampleData<'bound>;
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 0bee16faecc6..6cff9bf8c80c 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -90,6 +90,7 @@ struct ParentData<'bound> {
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for ParentDriver {
     type IdInfo = ();
     type Data<'bound> = ParentData<'bound>;
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 13b035a95756..50c8709739c6 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -139,6 +139,7 @@ fn config_space(pdev: &pci::Device<Bound>) {
     }
 }
 
+#[vtable]
 impl pci::Driver for SampleDriver {
     type IdInfo = TestIndex;
     type Data<'bound> = SampleDriverData<'bound>;
