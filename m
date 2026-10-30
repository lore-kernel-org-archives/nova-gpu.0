Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380418;
	b=CQGoxA7hAcBWXEjaS8IdH37tX+F08XZk3ZMKt3FZ+rkUWTdMBweCUxX6OQczCAhtw3oh
	 J5IIv4LYyJ9TDMlNeASdJAZPC18tsZkmxFAMFEHdqc/uFyyReaEWgHjWQAwHzvWYYxPwb
	 my/hVL8JMcvu1rQOabCVKx5psxNgM40qlG6fYuzUER812hwLgIUJRABtuM0G+QO+syaFH
	 S7UiifxuCTw5Vwbfw5ZHQ7wt6Bo2PhYgz5+zCOXdg03yB1MECuH6sIdaX5aMoYpb+BqfW
	 ZsfJwBLWOL1yVTzTAAmuzpZGFelCnSHJdVJPSEOV/f072oZlQJzTHmL/wdMtgd1tRXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380418;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tVkH+Hxl7VP4uBseTBKue215wso22jw2O586kVovWWE=;
	b=dCS3W/K1WQA8skA14aoONd2+cW1GWQ0GUL50diBBXR3Uc0eJEO52BUDAjXOmt1CmCBeG
	 oZZZNUVdyhqOp49G6yAkoipbdpNij9X1KCEX0j57QjHir5tskL9fZLbZiRNlp14/rLEDU
	 s8dVOYgc+FWcssbPhAV846xp9xzPWhE4KRY8tpB3Rz7P5N2QWTU/a4/3cnfFCKkO47b8R
	 MRIBMJz8RmzKhRnqVq5PgfRfNSsa/ANG/az/Wvk3t5ZTBJjTwiuJu68MHMONFzdDQ5cvK
	 515v4RBogEwuw0idjMimBz4BOqHX0nJAmUGH2mshhvpxajtmHuctEupKyjLUVT675Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="p/Kz+4pl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.36
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2515F606A31F
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 17:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2515F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p/Kz+4pl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qiz4NSCdv4rXL+Opz/6K4nXoNUrnY71ecnlJc+U/wCgGV/IGE0lDfGj3mdek55pBmiFDQ/luP9gqVjbr5yVJ6V2BQCqG/A7DP+mh3ff1nEhE1WQo6M3xEPLLZJbTxBm0FaB4FH+aoMRjxTvxBt3EUXyaQGg4B1vD8QYEzI6Xcsrc7jR1UK5B1CM+0gP3QCbKvlHmM2FBtcGbSpZr1+aP2xA/vKymj5mFkasEcUJEVEJHm6hMGuEmm1ysOAgduH05AtzsXHJv8lNrLi798h0z5hdS+yzxUHdttcH4M02yUpwSFyq3/sfZl91+oop2EDl6YvGIemb4wiUtXFtYyXB1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVkH+Hxl7VP4uBseTBKue215wso22jw2O586kVovWWE=;
 b=UNVrZ5n9PCpO0A/ddztQz7GD+RslTu51eWN8bIq6pv0KmuT4HMIGZstjxKHx5+HIzOZElZRXpfxjB0bj4IJrYnGPOxHtf8hrsNt6hl7ZWUYltMS+p8khTf/Y5/PDRFfh08IFzK9Cyr365Q6hfEON0+M/aqex/h+b99kH+r2hgyYSHsWQDDr/e9m/bOx2mtCDyVD+Uq0hnMYNwcsQFOkqLTWjrv0HEWtH9W+ztkP3J9zehvdQFzhTa3j6sUTkb0KzM9PwQvYeRCLoekynJLY+YdA+hx8kM90FEsageCTNLWBqVUV6CpVfp5h0WnRdPDfOuNvXqCwfJl5IVf38AoPGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVkH+Hxl7VP4uBseTBKue215wso22jw2O586kVovWWE=;
 b=p/Kz+4plIyApxbjvJcg/sQDHncR2tlSuSY7DiqeohISSn1utadoANQ6Z/EJRvohsOOwfaFYs16DYSEDXOIWbdAS/m/YCeR22B027SVJOEm2ZKtIXuqC3NmnXpknZkI4dZOPLH8MJIsoWsjHCmdcw0yQDraG9XT+Z3JhyUpgzjuVcQqLBaUapJ9fDpndiGvQM2ifWv0cP3CqXvZ6H1f48d+ARGp5FfUTNHXkAwXwXvNa6dX9iI7O7yR0BOPiLA1qdOVAXrbQjxmP8Qp89Cpdr0AA50kMNmlv+TdOqvUrP6PDwictEV2hHu2bYRilvGQ4T8hKJo/OTJD5lMJwFuyCm0w==
Received: from DS7P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::18) by
 CY8PR12MB7753.namprd12.prod.outlook.com (2603:10b6:930:93::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.9; Fri, 30 Oct 2026 17:13:29 +0000
Received: from DS2PEPF00006E1F.namprd05.prod.outlook.com
 (2603:10b6:8:25c:cafe::a0) by DS7P221CA0024.outlook.office365.com
 (2603:10b6:8:25c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 17:13:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00006E1F.mail.protection.outlook.com (10.167.23.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 17:13:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 10:13:06 -0700
Received: from xinmengs-dev-vm-linux.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:13:03 -0700
From: Simon Song <xinmengs@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>, <kvm@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
	<linux-pci@vger.kernel.org>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <markus.probst@posteo.de>, <jhubbard@nvidia.com>,
	<apopple@nvidia.com>, <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, <zhiw@nvidia.com>,
	<boqun@kernel.org>, <daniel.almeida@collabora.com>, <tamird@kernel.org>,
	<work@onurozkan.dev>, <jgg@ziepe.ca>, <bhelgaas@google.com>,
	<kwilczynski@kernel.org>, <dri-devel@lists.freedesktop.org>,
	<peter@colberg.org>, <xinmengs@nvidia.com>
Subject: [PATCH v5 5/9] rust: pci: drop driver data before remove returns
Date: Fri, 30 Oct 2026 10:12:23 -0700
Message-ID: <20261030171230.196717-6-xinmengs@nvidia.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261030171230.196717-1-xinmengs@nvidia.com>
References: <20261030171230.196717-1-xinmengs@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E1F:EE_|CY8PR12MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9e2800-d8ad-4251-4a35-08df36a91e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|6133799003|18002099003|22082099003|56012099006|261028144727099003|11063799006|261021121427099003|261021123027099003|10067099003|261022105027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	ZHwQMM4srWHNfUH8wLIhLBylwm0WrYA4fUkXCO0r+etUGFp96kNCFukfKDedXR8d0ZcLYOHFIs7c4ieNdC64keflbsccWuyveuDoQ8vepBF/CIyeqSZM3wnggmlu++vxkJBx4Ld4gpcZ590GngVIUNmgq0wY+y6ZF4QZ2G08wgfe3+Rt4um4hsYBgM5EsY2G9PgU7sWptzo7BSeCIjUTbY9G81lspmtPyWVGJdKHgHHFN071xfP5sp0Z3FxO4w3dw8nQCwwgEy9Tj8RB0Pn0qNxMd3kcLnhtUskuGiBUZX4hASCrVUW8SZ5FgPa/UBlVd9UWYzBdMIfJ5V35IL+Cn8sDRM6Bc9a7Nv4WH7hTMXETNMmqeZ4aTH8J52Et2JguWfZIrH65Yb1KYNVioraBO8JuMtSwBOXMVzrwHf1+oDtPu8iFzggWcaMdzr1gxsKrgO3MDjQnNgQLbgRECh6FjFZZn99j1HFzSkeTI67z3QZ5du1/RKF/bqDO7ago8n/+iYuLkZ62lXTO29f3m5pMHwO+VFkAGc/CravnaJ7b5SoQSp46NpSjmK82wb8DdhsXTYiEpFzJq+7cuGWIgnWBDN6EfwWRuPDe9KR09WRG0DSJ4EI2EvicYtMf/FR6V/+C8cnxCPTCYjsb1lISAQhxRsX6q3YiAsc+yeo/AhdQwePFRj2TBLuSV6CfMJcJa+L0PfLJraKpqDsxzD2OpuVV9g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261021123027099003)(10067099003)(261022105027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3XawJBgYAtEQS1K+k+dbLX/J3y4QWWi79FSOLXaCPhEj36RfsUGxFAsR79yUfgxvAKe9vskxKd42MyDVoeFUx4XM33UjwQvvkjDph0VhvYTK0y9XZkgq0mKB/MFoFFFR3VU8wtH2eG/pzoOQ3RR2DlyQWR6UjQPlFakmjeJS5GDREXl7P+6FJ9FbyauJRoLli0IxzBQ5aGKIQAxhOP0TZzdbJ/EMtWK2kd74matOa2P3x7fRhnN3hQL4GfCLom3YcXxKb0oWDVS6i54rrhAOZXLHGdgMBghYA1kT/SZjcZH75gg9M3fbc82FvvdZUHU149bWzs82tRst4nbNNDM/F6PZwFiKtEP6XLLVrXf3a+O/ZbudlUS/tp3aeiZAzwHVdngBnd6skib1J1RH4BEwWfdABgpLhRmpERXdWMoF7vvQVivZ8u/hbh6rd8PaEk9a
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:13:29.4350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9e2800-d8ad-4251-4a35-08df36a91e48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00006E1F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7753

From: Zhi Wang <zhiw@nvidia.com>

Drop PCI private data before the remove callback returns, so its
destructors run within PCI core's removal context.

Call unbind while private data remains installed, then take and release
the data. Taking it clears drvdata, so post_unbind does not release it
again. All borrows must end before the data is removed.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Simon Song <xinmengs@nvidia.com>
---
 rust/kernel/device.rs | 4 ++--
 rust/kernel/pci.rs    | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b684..1f6bb58396e 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -243,8 +243,8 @@ impl<Ctx: InternalBoundContext> Device<Ctx> {
     ///
     /// # Safety
     ///
-    /// - Must only be called after a preceding call to [`Device::set_drvdata`] and before the
-    ///   device is fully unbound.
+    /// - The data stored by [`Device::set_drvdata`] must still be installed and remain valid
+    ///   for the returned borrow.
     /// - The type `T` must match the type of the `ForeignOwnable` previously stored by
     ///   [`Device::set_drvdata`].
     pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 9e1d02588af..8092f56ee2b 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -150,6 +150,12 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
         let data = unsafe { pdev.as_ref().drvdata_borrow::<T::Data<'_>>() };
 
         T::unbind(pdev, data);
+
+        // SAFETY: The driver's unbind callback has returned, and no callbacks retain a borrow.
+        let data = unsafe { pdev.as_ref().drvdata_obtain::<T::Data<'_>>() };
+
+        // Drop private data before returning to PCI core, while its removal context is valid.
+        drop(data);
     }
 }
 
-- 
2.43.7

