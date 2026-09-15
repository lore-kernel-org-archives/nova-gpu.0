Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B02B9BA
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505897; cv=fail; b=BxAxy5eiqbgjhDV4fvL0l8/MvpEF6bXWaTOYwo0bYuXOqerSuxtUOAdOaKVAnyQ4olfqNnMwg4JS6B2+6nOmW+murapIEoMQW9sFmq6objugWscQIRg/uecG0NY7XkZC3Fyj5dGoUzss6gogUSQeQWH1m2EunvtqJyQSlhmwRDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505897; c=relaxed/simple;
	bh=zgU9yxGMVb4XZJM0v7A/kpcT3PKF+EzqstSz1NlSF2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E6BO5UZTQC1KZWe77l/V6LQZahyG21wiARsPpWh4ySIu0IB7167GU32rGou2uLi4CEsIg380bDOHHUHO52a6hpXY1M6iEyvBgwywtFaJFUGsHvJ+SkkwIyp4httr+ma0qlWIFtT3MZqGonrjkYi2GvgGjfS5buGFQMztejwjZGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FV8usa4k; arc=fail smtp.client-ip=52.101.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FV8usa4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt3NIgYt3ZGITqPnIowoFEuW5ohoNnaIEZhjRI1KEnxgmT2AzcMNDON+vMaIUFt0r2hCXofIC5kN0mzj5JCPXURZ/t/4Ipcx37rNVatCcq4QbzUkgYvZPuxwueSc0aoB2bK8YkPjyTWOPHEXs4uMFP8zwCpHD0SM2rQSVveJF2jZ1m2Nb7hqfWyXdDqmDDwOfXnY/j8ysR6JBeeEFZTAVGJN78Jb6fa/5CmY2ZwMLWtxntVgnQyC7m6VmjCZeCa3Q6XbFeKY+V81rAMcFPOslL5xOGMPhYHUvRcJrGQ5OVuh13Pmf5laAF2MSoR/dLCTIbVM/iFwXy4WfsRhpZICsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqG5+r02RbRq30AaEL6hJ7fOFSh56QrMlOixmT/0BnI=;
 b=f/VqddiYAftL/ECX8HDKV7o9rq6vDMGI0k8Ie3qh7vt2ijE/QzS1BSS6zHFyOAj3OaA2LkW+3JNmYMKochmxav4c90DwY8Q0yaTVUFhOH9GAzaz9oQRauiJR/HDI7TYarpIyZGNsYwhwK2Qt/IKk8YPJwg75VIbE8BJGpS0y+MdovCIZSfhCJ4EBb9mlb7E/aTRvxfwQezapj5KE10dbjlrdCukgP1xn+WD2KfBqdHERa4u9//QPqFNA8K1sUwsXcbPPHlLtbVYc1ljkTAhiCzJpygYPNVPyzhyTECnvIuGcqb58MRQ6a3kL6o8Z7gzhpo2w7EkL/NpFq5sexRd8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqG5+r02RbRq30AaEL6hJ7fOFSh56QrMlOixmT/0BnI=;
 b=FV8usa4kLN9f7dEB/ZbErbBCg8rNMmMUcLjRRmwL5ni1qELHDc+fLTGhMEnc1e8ONmHi6OhzQ13K2ZpweSnnppW9br0wRGedtCXx79lObx2dcP0wUj0dj4hw9apLk1KOlaI686iwjGTeGrGara9SRZ2zmFbDhMaEAMJfNRiCdhSZZMQH+o1jJtDyVFzsu9fnXmcWGyKkVQdUkM6PfU7fOGTq18NNz7N+0hK6vskT0sSAH7h2D9yRMx8HWJ9Ngrontepwesg+EwaYo/PqlLYAAYIaHeyanLi9a1mDsMrDVfTsl0xOsXsQtbvDe1IE65szpKAwom1lBk1dhzwIywXXSg==
Received: from MW4PR03CA0352.namprd03.prod.outlook.com (2603:10b6:303:dc::27)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Tue, 15 Sep
 2026 20:58:11 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::42) by MW4PR03CA0352.outlook.office365.com
 (2603:10b6:303:dc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 20:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:11 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:49 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:48 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:41 -0700
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
	<zhiwang@kernel.org>, Alistair Popple <apopple@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, Peter Colberg <pcolberg@redhat.com>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 05/14] rust: pci: add is_virtfn(), to check for VFs
Date: Tue, 15 Sep 2026 23:56:49 +0300
Message-ID: <20260915205659.76841-6-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a4dec5-6f37-4c7f-4e5b-08df136c0d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	za22NXHg8wCiwNtx7colZO1yW4Spiyt2KdVj1v6R/utwA+seIQhl6qiFEnYJ+FgYQDypUERYoEpV2/W25dCB27YDTl3neXlZCktCbN67ACJPYhBf/TkkfptDqwRp3w+N9CeGk4/6toBEX9j3tqBxQ9pwxRxHmluLDPOVnIUM0P7MQKSNdBF0EW9knCYEOiV6dhpkXnv68vpXYljSTU7aQXtFZ1FWl77bYDmvZA/JLI9Kf5z8o65ASjMivAoqSAvW1VikA8ubxyhisb+EcOB5zWmLvWesbwQaVt2xGbWrSrJeYMFtTVj04Mew/UAzRfLdi3McOkMIYjlgQKqunV41d/yo3xL5EGVvR6F04H0MuZGA6Vthso4+zKNf6riNJ/Sf1Xbm/bDl3Grb2fEcrgQQIxfgjzUA8agrRMAAP4cRNig2a/UMeZLCjlht2wP0jSuafIkGaxrGjLp0isCiGnmJsD1j3EK58rtNQUeha8oKxyf0qDZ6q8QUYeO9Eq0t++OnuH5Qp0zFIJJUNQSBu3WDF2GI84EihnTzPWyUjULhUr9v2lUJ1gYS2B05ga006kVozZuN9IPR57VIxhktsYQ99pnYmyYiWhQdcQu8FNDlwzykvKhB0nxqRW4mIEeZOfRNnlx5fsVHgj4CtBCuFl6pkwbLxMgTWr+O8J7vYbBDJ8veCZjGWOJ4JVKAyi79SRyxHqnvafy7kO+rulJcJ2sl2A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vrLYx5HY8n4PZ/IgSNrqqQcqEhHimZHBVyCDyTV7+dEKNzc10XpyroZH4iC8daTLDrUubM/wQwNZAuxh0LFVdhSF6fG2xAoTNMzn+WDJPQbcnmTM3RzcFp78MKKjR2ktKvjkZc/KIKD0PhuLNY4VrJ2QHJ54G1wXPTOCz98shv8tkWPIiOplQW6H8b5mE6D/qExDrcaQ+GSX3DMDOkt8afNXx9XBL0XHtiyXkqdM2offehmCbvT5AvhltdGpz6CB4CP7C/tiIB/utYzPx5TPYmuFEAkBJNJFsEGsOygQdIq7E32LCvywVm7SPEcQ9gT3fJPl5lP9og2wB2DZkM/UtmQYMBd7D5GYZBP++G07u+Q2mbZuWaLbyIhaq1yBeoSywmgVWgPe/1/ICFieIAwMXwNmadkaxJ1G0e5H9cV/0kwPjXJVBkte6rlJb+QkdhXT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:11.2980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a4dec5-6f37-4c7f-4e5b-08df136c0d83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735

From: John Hubbard <jhubbard@nvidia.com>

Add a method to check if a PCI device is a Virtual Function (VF) created
through Single Root I/O Virtualization (SR-IOV).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 rust/kernel/pci.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 7f50c1c96a4f..844d73a83670 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -507,6 +507,14 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Virtual Function (VF).
+    #[inline]
+    #[expect(dead_code)]
+    pub(crate) fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
