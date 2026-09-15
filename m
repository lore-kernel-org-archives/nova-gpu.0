Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A472EEE7C
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505873; cv=fail; b=NcezyiKxnvZj6u2kGe8o6OjK5xZH9Pb6DhJH7cWOfMM5xhhoUs4DMGpjWyFdLHui+CVl6ia858QqNaiiHgvAQgvLrxpnSsxtO5MpddwI6yunp8Iz2cdGe3GEh4vCyq75e69idvjM0VigJ1ezQlRql/gNTr83vqNu2rGyLg4kgKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505873; c=relaxed/simple;
	bh=A0AZPXwbE2B/6ZO7IqSuVZ2g0K6QaV7JMa62RRGaapo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XlPrU7nMBvUDp/odn0hKQczZ26y8k09tFSIr8UBAWLNSLdiBOJ8mj4tA8bGxnSQnGh4uVgGXmlzBVjJEJ/NufXedf5Bjm7UOffnWZZ96L58twPBR4Y575YjeRdv3az3yagM0XZHBWFcskOJ0sGswUIQ3sXDlkS+H05y9i/pnkiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FRRVHOcQ; arc=fail smtp.client-ip=52.101.56.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FRRVHOcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPNr2asR224XuL+xoSARQbpxroxZMpWPnRFFqj4K1LZ7BYYUBa3+Tofi28wSCSXc2O5Q9ngKP7/K2QCv0DZwjn75559cB7+/QX6NAb4UVIjCT2+3ngjKx8iDelPDlQYivJh83YoBpGMZRg42Tb7aMfGSyGabYrIKPVwTKabJPm+c51kgKWz9pqQsuZJuYcfypnuNpyQzGyNl1vhxG4OCndq1L/iFygZgtdnRHEzWjIBDh7xY3lprEMypGtGz5uHCRW2DqxY8BOzqfA1PHmHvh1s31tlbBQK3EibKATOZg1H8f7G8L/kexswinJUAYIwYH4CgoeKOTiOK7atip2bnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzg6S/pmKEEK/2ko1+KSky4BY+Ww4e2mMC1YECpI+IE=;
 b=bemq0DT5DOujYuQH75eAvkp/NkTURDcf24PVUKQS+a0ImTiewC6fdkNqyp9wjQGLRaaQG0haaTUlNh6qxuVLMRxQ4hoZLDn/ESljf1aQ5OwfjXINV1i8EDjV943vSYtJ77rToWHi3Il6/lRkhSlW0DRC4sousHetn6qQ8K6oVtjH19tT3M1v8oFlPOuqZEz6RWJRJwavfW92bEbV3t7Q+LdB/bz6WE7hBxt8GygJAMmE2T+chM8ENtNaXV8ZxKb97oUslHhFS1ZbNaKcRjvf0L9A9gPzGs2DQFB0M2EQa1WsxZDlqnWGSU5KehaCSRvpR9u6anVXhtW0Loju5xK8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzg6S/pmKEEK/2ko1+KSky4BY+Ww4e2mMC1YECpI+IE=;
 b=FRRVHOcQrL0zlsDIwF/2H32/px8WVeEgNxaxnMMQiwpVXcKlJMwOfdmeiU2zRlVceoTnMc3qiFTmHmPnwL/P51p8zpOS+yHTivYqF70OaPXIAGV+Bgw5lclF5OvO8lO7xrRCo2Tzyg4yFBTxLTWYmvl3MMO9ImCJp5Sp7hJ2NFJJS3zxTl91I+EXX/ZxaGcedHp02TmklbmI38LGGpcQEJlY7wXiTViDKWn9uWI8QvHlbTkcjKTq95OlRmKWJZXBXo8rK6r04I1W775HjOIlsnxfpoUfHiLLLkKfgOvJdtZvfvusFzTQSZ/vSL8fb0Dqw+u4DlBeXdHnxmekfVuKvQ==
Received: from DS7P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::9) by
 DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Tue, 15 Sep 2026 20:57:35 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:8:25e:cafe::88) by DS7P221CA0032.outlook.office365.com
 (2603:10b6:8:25e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:57:35 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:17 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:16 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:09 -0700
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
Subject: [PATCH 01/14] PCI: add driver flag to opt into disabling SR-IOV on remove()
Date: Tue, 15 Sep 2026 23:56:45 +0300
Message-ID: <20260915205659.76841-2-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: f9673ea9-396c-467b-ffb2-08df136bf857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|56012099006|5023799004|6133799003|11063799006|18002099003|22082099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	0sLLuD6/SwHllzhn2mPk4yRE1CUQvc91BBxtVFl8rbDYnB12uHGAjbR78ViRV0MuBVrIdH+tAeDg7mp3QIdZeenxQUXjtCvqja118bxc6HqMP3Vvnm4oi5MK6DEHU/Qcl8g47wGadlJAk4Yl9AE9OiNdvA8TKfgQtw5+SUxCc3Fr2aplTAjDdvBf4JVcqpUl0k0vMI3JiLtYVLHB3YfwInoC1aBGgWjVUUT6/Jaq9d/vHskf/6mxabqL2ktbjPmGvuN7mrow14uIfnZTAKrVLcCWl13lvzJy4k+DpjUxZSIN4Sg5eKgIcmWaXk945pXB438Rem2ZJ3ABVs4mv3PhPo8W6mbUwPVFc6Mh2Tv655R0wte27Ft8RuDieKBtIuSqx4mlPiHvEcBJ09i0TcK7+clpGK2bg9ba+t+qpVMflYN/LOBtcXTKaLr4jiwNGkEmzQeu+DWjHStGULO941LOOx6UDf7Qyzw6t7XKaeTQN9kDhOAenWhZW70rfALB7rf6xaOl8IgazXJRDkZ2oUPnNS/4OHRay2tVqeRVKN1OkIDXAW4xjFVk0bTD3iafLbmoLfqSK4MiPe+ZUgJIaGG2iE41Xm7gdOEPLEM5odw6mLM5xnVTPXvCOPOUUiZ9mym0SGPrMa0ZMgQNE2ncSsauq1eQ/DHN3h+ET77IIsaZePLT5ToqDs3TWe7pyjLPGYUih/e9WgxrdPKNYh3iUnTx4Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(56012099006)(5023799004)(6133799003)(11063799006)(18002099003)(22082099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	59H46dzXyZ841u0epvvabVKYzUEkesuGjGepdbyDvfCQFoVSZZQGc+SZWgmVbxyUdAvOyM47K4EiqCxdWgaQ88kfkjoiWmBp5poefO4VkdaXYZWphs+Y6YMnjIOYquu6Q86cChJV9J9MgXDA9S7geGoK4Fk2uIW1IzHFPg4u9C6UjyOIw2K5yF3JMM8bb1Z7JNY5/fm6irPkqXinEJ/4zZZRLPv8sLi96p2Qofqu0p5pJsmlBTOBFjX2rw6Z0F7aenawglVFZAQVqVnhOLqYCA3Y04Woqcg5KGdoJr6gVZnR7MTCg+n0B8ODjvnhenAdGfAU10EiRvbTDh36goJSNoWB//GEVflzjm9kpVqDEuvp04jVsfgfsqAwtYmCGQ55II3ZoZpg05+L5co6IXU1ypU+nx328lH/AP6t8iUkpxJ4wzD9nGgQ1TgNRlxWHoVg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:57:35.7804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9673ea9-396c-467b-ffb2-08df136bf857
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245

From: Peter Colberg <pcolberg@redhat.com>

Add a flag managed_sriov to the pci_driver structure that allows a
driver to opt into disabling the Single Root I/O Virtualization (SR-IOV)
capability of the device when the driver is unbound.

Add a new function pci_iov_disable() that is invoked before the remove()
callback of a PCI driver and checks for the presence of the new flag.
If the flag is set, invoke the sriov_configure() callback to allow the
driver to gracefully disable SR-IOV. Warn if the driver fails to do so
and forcibly disable SR-IOV using sriov_disable().

Since a (broken) driver may theoretically re-enable SR-IOV during its
remove() callback, extend pci_iov_remove() to forcibly disable SR-IOV
after remove() if needed and only if the flag managed_sriov is set.

Create a persistent managed device link from each VF to its PF before the
VF can probe when managed_sriov is set. The driver core therefore waits
for an in-progress VF probe and unbinds a bound VF before unbinding the PF
driver.

Altogether the flag ensures that when a Virtual Function (VF) is bound
to a driver, the corresponding Physical Function (PF) is bound to a
driver, too, since the VF devices are destroyed when the PF driver is
unbound. This guarantee is a prerequisite for exposing a safe Rust API
that allows a VF driver to obtain the PF device for a VF device and
subsequently access the device private data of the PF device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/pci/iov.c        | 52 +++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci-driver.c |  3 ++-
 drivers/pci/pci.h        |  2 ++
 include/linux/pci.h      | 10 ++++++++
 4 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 9d408fb8ac25..ee5eff209e15 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -382,6 +382,17 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	}
 
 	pci_device_add(virtfn, virtfn->bus);
+	/*
+	 * managed_sriov makes the VF driver binding depend on the PF driver
+	 * binding.  Add the device link before the VF can probe so supplier
+	 * unbind waits for an in-progress probe and unbinds the VF first.
+	 */
+	if (dev->driver && dev->driver->managed_sriov &&
+	    !device_link_add(&virtfn->dev, &dev->dev, 0)) {
+		pci_err(virtfn, "failed to link VF to managed SR-IOV PF\n");
+		rc = -EINVAL;
+		goto failed1;
+	}
 	rc = pci_iov_sysfs_link(dev, virtfn, id);
 	if (rc)
 		goto failed1;
@@ -1015,20 +1026,59 @@ void pci_iov_release(struct pci_dev *dev)
 		sriov_release(dev);
 }
 
+/**
+ * pci_iov_disable - disable SR-IOV before PF driver is detached
+ * @dev: the PCI device
+ *
+ * Invoke sriov_configure() callback to allow the driver to gracefully disable
+ * SR-IOV. Warn if the driver fails to do so and forcibly disable SR-IOV.
+ */
+void pci_iov_disable(struct pci_dev *dev)
+{
+	struct pci_driver *drv = dev->driver;
+	struct pci_sriov *iov = dev->sriov;
+
+	if (WARN_ON(!drv))
+		return;
+
+	if (!dev->is_physfn || !iov->num_VFs || !drv->managed_sriov)
+		return;
+
+	if (!drv->sriov_configure) {
+		sriov_disable(dev);
+		return;
+	}
+
+	drv->sriov_configure(dev, 0);
+
+	if (WARN_ON(iov->num_VFs))
+		sriov_disable(dev);
+}
+
 /**
  * pci_iov_remove - clean up SR-IOV state after PF driver is detached
  * @dev: the PCI device
  */
 void pci_iov_remove(struct pci_dev *dev)
 {
+	struct pci_driver *drv = dev->driver;
 	struct pci_sriov *iov = dev->sriov;
 
+	if (WARN_ON(!drv))
+		return;
+
 	if (!dev->is_physfn)
 		return;
 
 	iov->driver_max_VFs = iov->total_VFs;
-	if (iov->num_VFs)
+
+	if (iov->num_VFs && !drv->managed_sriov) {
 		pci_warn(dev, "driver left SR-IOV enabled after remove\n");
+		return;
+	}
+
+	if (WARN_ON(iov->num_VFs))
+		sriov_disable(dev);
 }
 
 /**
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index e16aa59dd7ac..d71d72aeefd2 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -523,6 +523,7 @@ static void pci_device_remove(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
+	pci_iov_disable(pci_dev);
 	if (drv->remove) {
 		pm_runtime_get_sync(dev);
 		/*
@@ -536,8 +537,8 @@ static void pci_device_remove(struct device *dev)
 		pm_runtime_put_noidle(dev);
 	}
 	pcibios_free_irq(pci_dev);
-	pci_dev->driver = NULL;
 	pci_iov_remove(pci_dev);
+	pci_dev->driver = NULL;
 
 	/* Undo the runtime PM settings in local_pci_probe() */
 	pm_runtime_put_sync(dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc2..6392da39a5e4 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -986,6 +986,7 @@ static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 #ifdef CONFIG_PCI_IOV
 int pci_iov_init(struct pci_dev *dev);
 void pci_iov_release(struct pci_dev *dev);
+void pci_iov_disable(struct pci_dev *dev);
 void pci_iov_remove(struct pci_dev *dev);
 void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(const struct pci_dev *dev,
@@ -1021,6 +1022,7 @@ static inline int pci_iov_init(struct pci_dev *dev)
 	return -ENODEV;
 }
 static inline void pci_iov_release(struct pci_dev *dev) { }
+static inline void pci_iov_disable(struct pci_dev *dev) { }
 static inline void pci_iov_remove(struct pci_dev *dev) { }
 static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
 static inline resource_size_t pci_sriov_resource_alignment(const struct pci_dev *dev,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d31a8d107b1e..bc0d36204940 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1025,6 +1025,15 @@ struct module;
  *		how to manage the DMA themselves and set this flag so that
  *		the IOMMU layer will allow them to setup and manage their
  *		own I/O address space.
+ * @managed_sriov: Disable SR-IOV on remove().
+ *		If set, the Single Root I/O Virtualization (SR-IOV)
+ *		capability of the device is disabled when the driver is
+ *		unbound from the device, by calling sriov_configure()
+ *		before remove(). The PCI core creates a managed device link
+ *		from each Virtual Function (VF) to its Physical Function (PF)
+ *		before the VF is probed. The presence of this flag therefore
+ *		guarantees that when a VF is bound to a driver, the PF is bound
+ *		to a driver, too, and that the VF is unbound first.
  */
 struct pci_driver {
 	const char		*name;
@@ -1043,6 +1052,7 @@ struct pci_driver {
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 	bool driver_managed_dma;
+	bool managed_sriov;
 };
 
 #define to_pci_driver(__drv)	\
