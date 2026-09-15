Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B9477998
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505942; cv=fail; b=CKZZNTQltJzZz5mrqKzaTDjSgqXTw+fCZkeIG13k9ZEvACISfhlrrTzn2WjJ4lYiRJZTlmgNENta/vuhxXh1G/b38/wtJgrvPWI26jvZ+TK92bnWYiEtFT92eyVicv9oqj6QRvSxGk8Y+aGSw+xyUMhPxTKlZysjuZZxjkGQdDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505942; c=relaxed/simple;
	bh=yL2USA5/K0s+wBkxqK6TzwNOal+vKORQon34dw9eInU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utGfnx0jdcn+X0NvmWk7t4BWfQFp490jz9tVzlVm3nDSOUOWs0MLkCtnov1zyvScaPvtCORU7Q4L4eOjuleFabsRu7EEzp40C41HtFSMI1N4b861N0Snb5fCPbh29+2DfWjDnKqmEVZi/GrdJAf6YKTBVHm8+dGeYIgvIh9XFcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bOxcYolP; arc=fail smtp.client-ip=52.101.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bOxcYolP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk4IALS+kO30tP6VNG9ut8yh2KJty/Rr7yC5jI68u+SPFWhU3LEpNvnTT4D9aRmAeBZhxt6gUU1B8krjBMXCzEuq6Gw7WrRC3Z7Urfyh/ONlk+ntaVrw8xfx4IojWYSYqmbf9vu3qCqkjezLVYReFnY/HlZEkcaJ839Zr09yyk/VyzQoRUKT2nuvxyAFpL5T8t+DFEU0RQ5RjMT4RHrDrqboaCznO+gissBhQZAg3ptemByLdYCTwU7D1Wz/L+81WNmqkbf/+zxh3Gbaai+eSKrdYpadiQKsMamJxKAslA/31w+QjqVEv7dfRDuFLcK5Ucf2BkO++JWNqYPPj4iswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be0C6kz4NKeFeICVK1TQ9UVq4OMPLYozpM2zWyVYpLU=;
 b=UG3GryMw25mxMWbg34nSskjiLSez1mTR8mCo3E23esYcLKul2wpmO+r7rqUpEssYjUTduoU4eS7X5DGtTlKjQtRZ8gru+8Lk6fBmveb/IHW62oe7jW4ir7i+bAlagMIU+YNH23RpV0qfIxqIL1ud3SbR6Y9t92d/AsneB3okqc3wQJIQ4QquN36RLU7E/KoeupKPD7fLgqI5MlHC+2eZjETL18jS3A0mXnGOFaadjvzITiNlBiGZnKrWF/7JOBtkMJzm+1kg5NU0T+JM6CZ3Fx12Kk7E1i6jfM6e4KxNKKWAzIYkt4uLsiIr+t1ey/8d+pfV7HSQ7vUyOORBVDUEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be0C6kz4NKeFeICVK1TQ9UVq4OMPLYozpM2zWyVYpLU=;
 b=bOxcYolPABBpePT8UcTJ66+zZr9jaHp0Mz0JJxazp1ZGEpitj+8psKtxUFSOjfhd2DXyyLhTWC/LgcVsxtoCLHeu52QiJq+FzZxMTa4Oh2lIIJTqEC1kqy252ZCIQeBCP3O5OFXzASqPIXDlmlYhs65wI4r6SdTm75MlTEJE4JToJg+8jXBxPUnPJfKIjBlB7MGv1n0FtJ/QI6k+96zjZt1vPRZ8DdQjw/KWksD+KWpKBLHWgT+8nlRIjysBYRPAq1DUANCcQBjDxULSZahxuaENVeL3mLJuev6bG3gvTTY1mKHZvh1TECk1mZRA+3ydpij1ot5L7fx0GtM4PpH/7Q==
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by EAYPR12MB999182.namprd12.prod.outlook.com (2603:10b6:303:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 20:58:53 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::af) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Tue,
 15 Sep 2026 20:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:36 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:36 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:28 -0700
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
Subject: [PATCH 11/14] rust: pci: add C FFI support to typed SR-IOV PF registration data
Date: Tue, 15 Sep 2026 23:56:55 +0300
Message-ID: <20260915205659.76841-12-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|EAYPR12MB999182:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1f3628-f4fa-401e-a52d-08df136c2657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|82310400026|36860700016|5023799004|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lRGt77+BfCVgPI9cCEaXfezFUnwMUdT14OZvbjiwiTV2Pl6ChYH7Kv4/tfvaUgl9zySONqqB7VqV4+7hQ2jAFiU7uipz+i1ziYTKt4DCC/FEbrg9nKkjhFhLWELlJT5EJ5ax8OrM0RtndplhCWDqFO7EYfJr9bvzmSjEzowzYXMUM8nivoAdhEqPoOe4fDjHr5JvzwEi/p6tMnU6wnrsKLvOECEf1BfsiN4CxpRPwalfZzFilDLfxqxiiVDZTrweIhQFW+GslE7OGPKhyzenNs5Th+VZbDjIxhOuerUDa/9x2r9OmQXMYR/OXpv5RvUblYhCa7c560RHg03Jb1N4QkKEa4HW+thec+tVkX7nP6rwUoumJDzTAqTt8X47eMiY54eR7gDFVV9Q8tmV3ygAtha7QXvr8C1UfOjGU5G/Idn9tdzcPW+TPj9IDu1731nWh5yaqlukloyHcDemqWtyJYnHLxIKEvhFS43rFZ4bVzW+Vn2FAJ8wgjsFr7I3YeotEfCQTyhImPjkHAPhyDE0nbpN3V84cJxnxZEXO3/M5aB1ctjhjybsTOBi2jTWbP5O9oVH6lM3P5V+S1Kbq+2MFRebxE3S3cHBro2x3by+8UMxbpQLk7qauJSiB4kT0Qb+8G8zV6qrO3nf5llH1S7NODyu68XNCStOewO2vBy2u0w5SRrFVIE3fAoJIvySgeo+HTBP88dVWpnXFMpxoQwBpw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(82310400026)(36860700016)(5023799004)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rHaV5Qa/OdEvVxpr4GqEH9s9nsoboUjEEImy8CimWrjhWAvLMHs9EH3AKGRZk9sWay81RQwXEZIPum1UYjcyD114IsMb5eJ9xO6yWd7Wu+X0XIdc141NSdoDF1oKAGJW+bZjoMzsgk31PI2H+YtqU5APE+mz5ZitK/m1pqZUJQkdQth41Px4tbSKIiuXE4VcFK9gyEEWEi4l4gTGfnx1rfuHgqShyNfYW5wNu9CGQuTNtwc2iphF86JFHGiw1XngIKWLlHoc1CRlS00+gV1deNUb9wiPNS7v/plSA5+39KRoTIB74wd8MMyd8en0MHRJgcI8LXyEQQN9IzdZUmkJ2f59TLIhKOytdi1IKd3mungriv2h8E3dsdC46Zvb/QPJIiao0p0vdpnllROmSKaw/zzQoHzC/SzfHMeG6/wSbNrXZ6oubIEYtEUJQK27L7va
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:53.0134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1f3628-f4fa-401e-a52d-08df136c2657
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999182

Rust VF drivers can borrow PF-owned registration data directly, but C VF
drivers need an ABI-checked operations table and a pinned context.

Place an optional struct rust_ffi descriptor at offset zero in the
registration header while retaining the Rust TypeId. Initialize
registrations created with new() with an empty descriptor, and add
new_ffi() to construct a descriptor for the same pinned payload.

Add pci_iov_borrow_rust_pf_data() to locate the PF descriptor and validate
the token, ABI version, and operations-table size. Require managed SR-IOV
so device-link ordering and registration teardown keep the descriptor and
its context alive until the VF driver is unbound.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/pci/iov.c          |  51 +++++++++++++++++
 include/linux/pci.h        |  34 +++++++++++-
 rust/kernel/interop/ffi.rs |  15 ++++-
 rust/kernel/pci/sriov.rs   | 110 ++++++++++++++++++++++++++++---------
 4 files changed, 179 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index ee5eff209e15..0f3ae75b8a7c 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -11,6 +11,7 @@
 #include <linux/bits.h>
 #include <linux/log2.h>
 #include <linux/pci.h>
+#include <linux/rust_ffi.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -80,6 +81,56 @@ void *pci_iov_get_pf_drvdata(struct pci_dev *dev, struct pci_driver *pf_driver)
 }
 EXPORT_SYMBOL_GPL(pci_iov_get_pf_drvdata);
 
+#ifdef CONFIG_RUST
+/**
+ * pci_iov_borrow_rust_pf_data - Validate and borrow Rust data from a VF's PF
+ * @dev: VF PCI device
+ * @token: Required FFI ABI token
+ * @abi_major: Required ABI major version
+ * @min_abi_minor: Minimum required ABI minor version
+ * @required_ops_size: Minimum required size of the operations table
+ *
+ * This may be called from a VF driver's probe() callback or from a context in
+ * which the VF driver is known to remain attached. If probe() succeeds, the
+ * returned pointer, its operations table, and its context are borrowed until
+ * the VF driver is fully unbound, including the return of its remove() callback
+ * when present. If probe() fails, the caller must discard the borrow before
+ * returning. The caller must drain all work that can use the FFI before the
+ * borrow ends.
+ *
+ * The PF must publish an immutable descriptor before enabling VFs, use
+ * managed_sriov, and retain the descriptor until its remove() callback.
+ * Managed SR-IOV installs a device link from every VF to its PF before the VF
+ * can probe. The driver core therefore waits for an in-progress VF probe and
+ * unbinds a bound VF before invoking the PF driver's remove() callback.
+ *
+ * Return: A borrowed FFI descriptor, or an ERR_PTR() value on failure.
+ */
+const struct rust_ffi *
+pci_iov_borrow_rust_pf_data(struct pci_dev *dev,
+			    const struct rust_ffi_token *token,
+			    u16 abi_major, u16 min_abi_minor,
+			    size_t required_ops_size)
+{
+	const struct rust_ffi *ffi;
+	struct pci_dev *pf_dev;
+	struct pci_driver *pf_driver;
+
+	if (!dev->is_virtfn)
+		return ERR_PTR(-EINVAL);
+
+	pf_dev = pci_physfn(dev);
+	pf_driver = READ_ONCE(pf_dev->driver);
+	if (!pf_driver || !READ_ONCE(pf_driver->managed_sriov))
+		return ERR_PTR(-ENODEV);
+
+	ffi = READ_ONCE(pf_dev->vf_registration_data_rust);
+	return rust_ffi_borrow(ffi, token, abi_major, min_abi_minor,
+			       required_ops_size);
+}
+EXPORT_SYMBOL_GPL(pci_iov_borrow_rust_pf_data);
+#endif
+
 /*
  * Per SR-IOV spec sec 3.3.10 and 3.3.11, First VF Offset and VF Stride may
  * change when NumVFs changes.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1ccc7fee7495..4a7189ee247f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -339,6 +339,8 @@ struct pcie_link_state;
 struct pci_sriov;
 struct pci_p2pdma;
 struct rcec_ea;
+struct rust_ffi;
+struct rust_ffi_token;
 
 /* struct pci_dev - describes a PCI device
  *
@@ -352,9 +354,10 @@ struct rcec_ea;
  *			Such bridges are allocated additional MMIO and bus
  *			number resources to allow for hierarchy expansion.
  * @is_pciehp:		PCIe Hot-Plug Capable bridge.
- * @vf_registration_data_rust: Rust registration data published by the PF
- *			before enabling VFs and retained until all VFs are
- *			removed. The PF driver must use managed_sriov.
+ * @vf_registration_data_rust: Rust registration data beginning with a
+ *			struct rust_ffi, published by the PF before
+ *			enabling VFs and retained until all VFs are removed.
+ *			The PF driver must use managed_sriov.
  */
 struct pci_dev {
 	struct list_head bus_list;	/* Node in per-bus list */
@@ -2614,6 +2617,22 @@ int pci_iov_virtfn_bus(struct pci_dev *dev, int id);
 int pci_iov_virtfn_devfn(struct pci_dev *dev, int id);
 int pci_iov_vf_id(struct pci_dev *dev);
 void *pci_iov_get_pf_drvdata(struct pci_dev *dev, struct pci_driver *pf_driver);
+#ifdef CONFIG_RUST
+const struct rust_ffi *
+pci_iov_borrow_rust_pf_data(struct pci_dev *dev,
+			    const struct rust_ffi_token *token,
+			    u16 abi_major, u16 min_abi_minor,
+			    size_t required_ops_size);
+#else
+static inline const struct rust_ffi *
+pci_iov_borrow_rust_pf_data(struct pci_dev *dev,
+			    const struct rust_ffi_token *token,
+			    u16 abi_major, u16 min_abi_minor,
+			    size_t required_ops_size)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
 int pci_enable_sriov(struct pci_dev *dev, int nr_virtfn);
 void pci_disable_sriov(struct pci_dev *dev);
 
@@ -2656,6 +2675,15 @@ static inline void *pci_iov_get_pf_drvdata(struct pci_dev *dev,
 	return ERR_PTR(-EINVAL);
 }
 
+static inline const struct rust_ffi *
+pci_iov_borrow_rust_pf_data(struct pci_dev *dev,
+			    const struct rust_ffi_token *token,
+			    u16 abi_major, u16 min_abi_minor,
+			    size_t required_ops_size)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 static inline int pci_enable_sriov(struct pci_dev *dev, int nr_virtfn)
 { return -ENODEV; }
 
diff --git a/rust/kernel/interop/ffi.rs b/rust/kernel/interop/ffi.rs
index a8c16a29110a..ea23bfecad32 100644
--- a/rust/kernel/interop/ffi.rs
+++ b/rust/kernel/interop/ffi.rs
@@ -99,10 +99,23 @@ pub unsafe trait Abi: 'static {
 /// [`struct rust_ffi`](srctree/include/linux/rust_ffi.h). It neither owns nor borrows the
 /// operations table or Rust context at the type level. The transport that publishes it must ensure
 /// that `ops` remains valid and that `context` remains alive at a stable address until all
-/// consumers have stopped using the descriptor.
+/// consumers have stopped using the descriptor. The default value exposes no operations.
 #[repr(transparent)]
 pub struct Descriptor(bindings::rust_ffi);
 
+impl Default for Descriptor {
+    fn default() -> Self {
+        Self(bindings::rust_ffi {
+            token: bindings::rust_ffi_token { high: 0, low: 0 },
+            abi_major: 0,
+            abi_minor: 0,
+            ops_size: 0,
+            ops: core::ptr::null(),
+            context: core::ptr::null(),
+        })
+    }
+}
+
 impl Descriptor {
     /// Creates a descriptor for a pinned Rust context.
     ///
diff --git a/rust/kernel/pci/sriov.rs b/rust/kernel/pci/sriov.rs
index efbe444e0733..a2590b66f78b 100644
--- a/rust/kernel/pci/sriov.rs
+++ b/rust/kernel/pci/sriov.rs
@@ -6,6 +6,10 @@
 use crate::{
     bindings,
     device, //
+    interop::ffi::{
+        Abi,
+        Descriptor, //
+    },
     prelude::*,
     types::{
         CovariantForLt,
@@ -91,26 +95,45 @@ pub fn num_vfs(&self) -> i32 {
 // depends on its device context.
 kernel::impl_device_context_deref!(unsafe { Device });
 
+#[repr(C)]
+struct VfRegistrationHeader {
+    ffi: Descriptor,
+    type_id: TypeId,
+}
+
+static_assert!(core::mem::offset_of!(VfRegistrationHeader, ffi) == 0);
+
 #[repr(C)]
 #[pin_data]
 struct VfRegistrationData<'a, F: ForLt + 'static> {
-    type_id: TypeId,
+    header: VfRegistrationHeader,
     #[pin]
     data: F::Of<'a>,
 }
 
 static_assert!(
-    core::mem::offset_of!(VfRegistrationData<'static, CovariantForLt!(())>, type_id) == 0
+    core::mem::offset_of!(VfRegistrationData<'static, CovariantForLt!(())>, header) == 0
 );
 
 impl<'a, F: ForLt + 'static> VfRegistrationData<'a, F> {
-    fn new<D>(data: D) -> impl PinInit<Self, Error> + use<'a, D, F>
+    fn new<D, M>(data: D, make_descriptor: M) -> impl PinInit<Self, Error> + use<'a, D, F, M>
     where
         D: PinInit<F::Of<'a>, Error> + 'a,
+        M: FnOnce(Pin<&F::Of<'a>>) -> Descriptor + 'a,
     {
-        try_pin_init!(Self {
-            type_id: TypeId::of::<F>(),
+        try_pin_init!(&this in Self {
+            header: VfRegistrationHeader {
+                ffi: Descriptor::default(),
+                type_id: TypeId::of::<F>(),
+            },
             data <- data,
+            _: {
+                // SAFETY: `data` has been initialized in place and will remain pinned at this
+                // address.
+                let data = unsafe { Pin::new_unchecked(&(*this.as_ptr()).data) };
+                // SAFETY: `header.ffi` is initialized and exclusively owned during construction.
+                unsafe { (*this.as_ptr()).header.ffi = make_descriptor(data) };
+            },
         })
     }
 }
@@ -138,28 +161,14 @@ impl<'a, F: ForLt + 'static> VfRegistration<'a, F>
 where
     for<'b> F::Of<'b>: Send + Sync,
 {
-    /// Publishes typed PF data for bound VF drivers.
-    ///
-    /// This returns a pin-initializer so the registration and payload can be embedded directly in
-    /// the PF driver's pinned data.
-    ///
-    /// Initialization returns [`ENODEV`] for a VF and [`EBUSY`] if the PF has enabled VFs or
-    /// already has a registration.
-    ///
-    /// # Safety
-    ///
-    /// The caller must invoke this during the PCI driver's probe and embed the result in the driver
-    /// data. On an SR-IOV PF, no VF may be enabled before probe successfully installs the complete
-    /// driver data, and the driver must use managed SR-IOV. The registration must be dropped before
-    /// anything its payload borrows and must not be forgotten. Probe must have exclusive access to
-    /// the PF registration slot. On a conventional PCI function, the registration remains
-    /// inactive.
-    pub unsafe fn new<'core, D>(
+    fn new_with_descriptor<'core, D, M>(
         pdev: &'a PciDevice<device::Core<'core>>,
         data: D,
-    ) -> impl PinInit<Self, Error> + use<'a, 'core, D, F>
+        make_descriptor: M,
+    ) -> impl PinInit<Self, Error> + use<'a, 'core, D, F, M>
     where
         D: PinInit<F::Of<'a>, Error> + 'a,
+        M: FnOnce(Pin<&F::Of<'a>>) -> Descriptor + 'a,
     {
         pin_init::pin_init_scope(move || {
             if pdev.is_virtfn() {
@@ -179,7 +188,7 @@ pub unsafe fn new<'core, D>(
 
             Ok(try_pin_init!(Self {
                 pdev,
-                inner <- VfRegistrationData::new(data),
+                inner <- VfRegistrationData::new(data, make_descriptor),
                 published,
                 _pin: PhantomPinned,
                 _: {
@@ -192,6 +201,53 @@ pub unsafe fn new<'core, D>(
             }))
         })
     }
+
+    /// Publishes typed PF data for bound VF drivers.
+    ///
+    /// This returns a pin-initializer so the registration and payload can be embedded directly in
+    /// the PF driver's pinned data.
+    ///
+    /// Initialization returns [`ENODEV`] for a VF and [`EBUSY`] if the PF has enabled VFs or
+    /// already has a registration.
+    ///
+    /// # Safety
+    ///
+    /// The caller must invoke this during the PCI driver's probe and embed the result in the driver
+    /// data. On an SR-IOV PF, no VF may be enabled before probe successfully installs the complete
+    /// driver data, and the driver must use managed SR-IOV. The registration must be dropped before
+    /// anything its payload borrows and must not be forgotten. Probe must have exclusive access to
+    /// the PF registration slot. On a conventional PCI function, the registration remains
+    /// inactive.
+    pub unsafe fn new<'core, D>(
+        pdev: &'a PciDevice<device::Core<'core>>,
+        data: D,
+    ) -> impl PinInit<Self, Error> + use<'a, 'core, D, F>
+    where
+        D: PinInit<F::Of<'a>, Error> + 'a,
+    {
+        Self::new_with_descriptor(pdev, data, |_| Descriptor::default())
+    }
+
+    /// Publishes typed PF data with an FFI operations table for C VF drivers.
+    ///
+    /// Rust VFs access the same payload through [`PciDevice::vf_registration_data()`] or
+    /// [`PciDevice::vf_registration_data_with()`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must uphold the requirements of [`Self::new()`]. A C consumer must stop calling
+    /// and discard the borrow before returning from a failed VF probe, or before its VF remove
+    /// callback returns after a successful probe.
+    pub unsafe fn new_ffi<'core, A, D>(
+        pdev: &'a PciDevice<device::Core<'core>>,
+        data: D,
+    ) -> impl PinInit<Self, Error> + use<'a, 'core, A, D, F>
+    where
+        A: Abi<Context = F>,
+        D: PinInit<F::Of<'a>, Error> + 'a,
+    {
+        Self::new_with_descriptor(pdev, data, Descriptor::new::<A>)
+    }
 }
 
 #[pinned_drop]
@@ -251,9 +307,9 @@ unsafe fn vf_registration_data_pinned<F: ForLt + 'static>(&self) -> Result<Pin<&
             return Err(ENOENT);
         }
 
-        // SAFETY: The published pointer addresses a `VfRegistrationData`, whose first field is a
-        // `TypeId`.
-        let type_id = unsafe { ptr.cast::<TypeId>().read() };
+        // SAFETY: The published pointer addresses a `VfRegistrationData`, whose first field is
+        // its header.
+        let type_id = unsafe { (&raw const (*ptr.cast::<VfRegistrationHeader>()).type_id).read() };
         if type_id != TypeId::of::<F>() {
             return Err(EINVAL);
         }
