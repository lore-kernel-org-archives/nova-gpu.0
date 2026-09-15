Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7174442B2E
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505920; cv=fail; b=lEvDPOHi3pW9qXlW0+jWEfotPE+1NtnRURn9gxftdU2eJiDG/LEt7iUbO5KvimCREZnq27NWgzfnUUDLK9IEaRgqJYM6JLNOxMTRZpkyCVKmLcm1DW5vJH0CMjSE4r+lkQh48hXWQOCDvNlS8hw12m31+O7sIgvHZv1Tqegf3ZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505920; c=relaxed/simple;
	bh=Phqft+sj8b1tyXU2yiK2+TbcZSHILXgo9TAbkm+11MU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQnLzfJXsXvfD8Kx+I8CJn9tGKExUSvZtqOPg4Olfpn/CIvwEx68TCTILtDfeTDu3GVwf/ZiwpJ/Fc7zjAdMzeJfpCiWxWkhh49o8qDQ8xwAE4b0d9JAt1n+nUgXHbqoyoQ36YYj0LY9goKgGQAH9ehSBMAuda3+J4lrrL/QCTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZdTutd7g; arc=fail smtp.client-ip=40.107.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZdTutd7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PA1P2CEvwxRIaEs9UCJFVQ41G085Hio8pxPDXj0D8qptgF8lbmL2A7eesz8G2WCaAZwUm2OUcdrlC73vZrEi3g+v1TGjmgJej2RNspi7RWwpJvppHf9I9VoqnJFY2p8syquXzUzfl1AC3pnhhGO6tCDk58zzCh45rRIU4h/WPKhVJg9+JN4+TcmyIXOK+9fQ3xabUzfVDeglxzPbTyH1lvqmzwgsREdNLfn7jpGFusDFDrULu90PxjeiiVryRVeBtsPR2KTGfVuaiiVjbTdnVnt4z7y+tCMU7/kkpWaP+mFzI5xWxlZpQLIEyc0moTuf3TrIATepAkp4w2L2mBcYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slYFLAfdpSF6E+uRfebiDOLx6yzaWxm+KCZefbrwxEw=;
 b=HYMIwYoXDvRIeTO2mXPuHqDvP4Rf+6YUJLPlf+G4Vq9+/KjIGxCd9Of3IuVrcJJblOQnH6XnmXtiQrPe1Hq/AkXcm/hf/hw8mJaOFEHtVwx0m0Vbjv5uHPkBlz672fM4ERmeP/ZRuAs9tavOvq8K/PGzzGWEUpuwTdN+MlinSKBeS6cDUuC79vd1wvb4gtNCx86HgxMTfHoXXqlMVWCA/OsIVFVQjAaIwvXdnn0b6J+mmB9/jlEnPdgHmXg+4GUvBSVLf1wsttARd3V5iSeoZBoHSTpouPBGWQPWzFj3EZeDeYgLB3CwhisU/SbOls0hbetBa117UwGo6L332VHxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slYFLAfdpSF6E+uRfebiDOLx6yzaWxm+KCZefbrwxEw=;
 b=ZdTutd7gofQK26e8DLzk1fy2X/yHOEJMQLE9dI2iS0Sg1om+SJECOdXE/TvJ1lde2x4LQYQG93zBHXjFjxcgd3w6aGhFlOTdwIohzeFQmkX1Si6N27Gv0XB2YQBS+xb8ALu0JdsTzge/xAjYD9FgjWFOFXa4WGnQx72Bh7jS6dnCrHDG8ORUl3YGDmSGTXcjEWSlOlGeGiDA3lf9ojd1h0qWrRaFQCRDB59Kju0jMcRDCQEG4RKlc0eNJM2eBQ9fN88yDOF5f4XOoEJzivciXeh39DoqCbMciEWzzAzTfA3u9qEKE69+NhJYhO/bRho8ukKDpjIzpGNJq0a0QyCpQA==
Received: from SJ2P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::19)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 20:58:28 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:5db:cafe::45) by SJ2P221CA0010.outlook.office365.com
 (2603:10b6:a03:5db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:28 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:05 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:04 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:57 -0700
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
Subject: [PATCH 07/14] rust: pci: add num_vf(), to return number of VFs
Date: Tue, 15 Sep 2026 23:56:51 +0300
Message-ID: <20260915205659.76841-8-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6e966e-5dce-4f2c-fa20-08df136c179a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ezIowKfblObDE06qCsAWwy9VuqM9n2y/k77ORd2oevx/+ttDSMLxN2WwR5ciRqujByZCw8J/BgnPmT8I1F5w67+rCaFEpbo6rf9iFk81WEhbyuj+itQeLs3eLy1rPQU27pUZi4ZxKjSRqvgdUTvAH0QptnfxK+LdFBibf97mhTWVosIwPsqmz0cV9iI4viXTCnIx4/y3xFBa7LCPgAfvdIp2yJARkKPwXlKv2dNtz2nV1RoblaPfKow0ESZMPYymfaOYFS0X3nz2AQ6GC8u9YRIg44mGZodyHi3C8r3LSv6zsWNzoD/ZOKLB3c/TKJ7ZDYhUwGa6VScAqn/4OR7Xe8meZP12NL7q2urBRscw98NmlFFVazdfiPLnQ4x3PWKnaNqcVlW5QdLc/SB/VzPN+THDYuMBRjRByDIHxD3byg26Bre95krJPF2mC29iKZHzn0xDfglqYTSs9Laf1GNh5DLbOs6wwp7gnx5OrQe9l4NcTITYoEGhGpAwPI632JwI6R/57HXgta9EedaevwC9/MIN+Fsn6nABafnWJ223FhdA61PBnUs32lil1pzIhFFnF/H4hWeDgLkxME6oOXQ4neFFemJb0M2/tW9P9oNHsrUCSATLnwIuQpcRLisYBZVZC42TXvLMZDKz5BYLitr6+2wJNjyeqQ5VTHHH3AHmHgGMAq+8SD3wk9kWmIx+HLxz5qQckS3dBupwDjCe6bcu0g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6LE+L2n3w0sPqCAz7zdywjhxalr232eat60ShIvnYRNXsr8uxzVyC5jukJPG5Y47fP1RmFewcbenoJLfedN4/G07pUoxzB5CY5hjFBSb/UPV87dXVN3IbAhTD9p1Gz86BOHcFmF4r1IAYmDSPllVH5/n2hCj/6KMxNge29b4Jg+TfgZpJ96rzbiCOPegaag873bCy2rd8lqmqIh9QGAIAfyQmsYZg9zhY3JPED4mVnZsEztpW33foQslEe6gYi/7aQC+Js/6TaR2qGHL1LMcQoXE+hcqVKLXcPaZFj9IN3j9TUmV2YtB+Fte/wxXKu39siS9C8eygBZQlRA2RgPr2fO6mOW+J+RgpypkFYp2up61XyWaGUNnncU0srtMFCrBTMc4UpwjIs2ir6U9rklCnUvOm9RAvCqWyYRhyUDtF6wHWNT54I86qTqIIazluEgP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:28.2354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6e966e-5dce-4f2c-fa20-08df136c179a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159

From: Peter Colberg <pcolberg@redhat.com>

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

zhiw: Keep this helper private to the PCI SR-IOV implementation instead
of extending the public `Device` API. Add a dead-code expectation
because this standalone API commit has no in-tree caller.

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 rust/kernel/pci.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index ed42511911d7..f2d71daef83a 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -523,6 +523,14 @@ pub(crate) fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    #[expect(dead_code)]
+    pub(crate) fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
