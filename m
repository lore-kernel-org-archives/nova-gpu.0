Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E434A3D2C
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507162; cv=fail; b=GGpKX0Y2KNLTwB9pn3ohMOyq730puPA29uLoFJ6B71pQP1CTr1cttmMHjU1alVDUla3RyOfCa0FCfkOaA5U+pG+CaLpN/FTbuO+p6dmby2p8BwEw9RqZexWXw82XdXWdnjHwd8dz8to8I1jkylCckRfmcJ9DvD1bbfMUS8iqs18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507162; c=relaxed/simple;
	bh=kFGm2v+bGm9i2GvMC0LyyGuPkBWSumeqNVx8T2z4ZNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWd5ceUxs/hqZcUq4Bq41qGjvGmFB5q+vNkCpnrdAzvdABSAvaNTbxueRiYo+7OlP6rlq1ROjm+ALcU+/d0pFO9hr6H+IAc4MHzoZa+mDfUqjnmTmUxlr526POQ2WFAQJ5fOqHWzaWiiiEn+nBgzNOnJnzqVn4RtFFOntSSpQGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J7SU/IQi; arc=fail smtp.client-ip=52.101.62.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J7SU/IQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV9Otv4bjtYb+4TGWXEPV7+pTOExzft6JqiMqdG3tgsgoCkY0gGOmUCkqL9U2L/4JF29aigXFRdEMZ03KWNw+nWxuefa1feaE5kr/pQRcSJzSIL0XTFSHuROlREluhpViNQK6atO4dr/4cYhNIpnQBqiKQgb7kSvGxtkq05/dU0Li1POFcUfsv+MgY+ocjhhzYhAlInRuZKqUd6QckUJon65xeBKO4sMTZ46rS1p0jlUOY9I+FgeU77k2n/J/dtrW9YkcqWB02mxRULTA9cCvxcjJS3zjn8uyVFim3a/Jhp/Xfn/M7BGS9gq7lo5JyM9ZQ4T5uM3ys8jYOS9sHbkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pItjb9yQrK1Xn9KMI7m/BfRYQvsm673YvQbU6bMLWSU=;
 b=UlGHtAUoTou6JqKMpy+MCW3ABo5tJ7hc4ZbOQScygnZ+o9w/Lzn8y1kCXhGDzKDc7MqhUOnPvnhFdkGmir+l8EHa1z2vL6na8hfkeVt/BQ5rJKaMEn4yku+aAH1BN7ZBJ/wRSyEnOsuDUGDqBy232NKANEZlHegVtzslQ4hl2WcS9Vf1DcxlL8+aMqtuI75NuF2yG8y7JKm6QTa3GqpInefVmympe6wmlRcrNo/y8PggZGK+wSXOj18tuHXsA1lI9iTIC23idEpDONCCjlw6RBIilyRWaPhT+S8LSb5VxNnrYpTQGH1bqSX8XVzvX/68pkAXwuGGLwFhROmArl+Jrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pItjb9yQrK1Xn9KMI7m/BfRYQvsm673YvQbU6bMLWSU=;
 b=J7SU/IQifAGHP5nzyg3EoiwkbIBTeCZFGPudJzAd5bpK9svpdqeJjdUJm3pffBsn0chH9gR6xv6O/Uw7V66fN4lR3nqkXTkrO+B+HA8ky5tzUMSo2FG49p+SUYoL7MLbTycakrlwy8FOsPZghYo2t36WOOI1M8iIkUYLYWNtYdviPEBYwVN29pzMNtdtd8bp6tFCIJi4Ow6DYwfm+feRUX03OIqftYi3v2Mws3920MbKP++/FZlWxPVgFIztLQMT8BidneYM1hjfCa7JIXHuNvwHFFOpN1XIHt34Gcz8WklMdazRuIhLrx0OJDQEsvsgPrsnRYI5m4mdFtB0CyrnGg==
Received: from BN9PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:fb::32)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 21:18:59 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::85) by BN9PR03CA0057.outlook.office365.com
 (2603:10b6:408:fb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Tue,
 15 Sep 2026 21:18:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 15 Sep 2026 21:18:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 14:18:35 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 14:18:34 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 14:18:27 -0700
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
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 2/2] vfio/nvidia-vgpu: add the NVIDIA vGPU VFIO variant driver
Date: Wed, 16 Sep 2026 00:18:10 +0300
Message-ID: <20260915211811.84790-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915211811.84790-1-zhiw@nvidia.com>
References: <20260915211811.84790-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: b25db569-4693-4159-31b7-08df136ef545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|18002099003|3023799007|10067099003|22082099003|6133799003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	/8PI75oVI7ohrgK0KDXzAsGNM9NwHsnaGZRh4SEK6uTl+sWjkqnS/LSQ9JBiMkhOGswcAX6D1+X8K/bZSPS0jfZ/JLKdfI4nVdrvGkO605haqyMCiYSr4D5O9GOmuRGH85gM/L5bSwKU+xszRV/lPzFGO7xniqsITD6tNmSOzSZvonoKGD0ehCMVHjfIBpbpEoyN74y6R7s+PB3fg4nIRyNsf8z5Afj0RaqRjIEpXo/qeotZOtXQHqSAy5gJwKZE4yuLP20XJvlZ8+PIDlTQNFYO2TlRLcAGd3dc07zyF9cdL/7HuJJXOrHBmstukbYOd6mPS7Z++Wo0MTz44VeilzJsAbOO5GHeyFyVn31OSEQzyXNVlIDsatMvRlvdJXpdHpRg1VCb/CQAsT/6IbFTYMb58hv+BYA3uzrT+VvzHU+Qky/A1OdTTQyiXANUNE4SiiP+46f81hOD4EmZqY2bPtLVQXnLBCif7dIOG2JALEhF67LBTySs6e2Wn3eBiO/VF0zOY1QjrNYu0loGEuQ69TwrGHN/6ie87BQWWDgJSa2aeKqLckXtpnz+RRJJiYI0XNVxDQSzoTbiy2teutbz5ghx5GcRIcFNaoAdyomwcS0LjhLKQWwG47KKBfD1ppE89WBkHauU4WX6jJ0OsUvAMudzYIvjXDgHVaO0rMUzTDjHZxr6mZgvDGY0G2aA8jOIzIHv7NxdICQKvHh6HoPS+g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(18002099003)(3023799007)(10067099003)(22082099003)(6133799003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sFZcQvW91tRHuopNtTHThpKbRZkt4nE6HXWoWGvX0mxb4FgRoeTjRXUnt1tuAAoKYzkvRseZtuzXxVfPmuRKPsivpL3IBHuF8usCWFYmiccFu+zE+jrxBXwjetcMdvoMtmQSHRriXUvP+rWBkR+8iBLAH1+bAuDeVc7RKb3vNHDkVddUxxaFF9c0+HiClp43bSUYfDjEi7/QDlt3mGYanuh9qCc1wyyif3vYkM4SNt8DS5y298Wo+8upCsizESWUkDCCN6hMNhJIHNqa28gq7WtBcIOs83qvfH6iEW3ZX+e8qa2AhvOpsx+AN7CGa1isiwFCmMeUJlhtUzbWoomDoAOYt+8rSpxt5oAelEaEXpq0mY2tayud/PXcKe+eLQIRNQZLbWLWcvgg+j3wjxFzvvyrSaquYhclethdomQHjNjOV8gDKLJ0FuF7qD6O6G4Y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 21:18:59.0349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25db569-4693-4159-31b7-08df136ef545
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691

NVIDIA vGPU VFs require their open, reset, and close lifecycle to be
coordinated with the PF-side nova-core driver.

Add a VFIO PCI variant with an override alias for NVIDIA 10de:2bb5
devices with class/subclass 0302. Leave the programming-interface byte
unmasked so the generated alias ends in i*, as required by libvirt
VFIO variant matching. PFs share this ID with their VFs. Use ordinary
PCI passthrough unless a VF can borrow a compatible, complete Nova
lifecycle interface through the typed SR-IOV descriptor. Both paths use
VFIO PCI core defaults and support PASID attachment; generic passthrough
also retains the core DMA-BUF export operation. Provide a driver-local
enable_sriov option for PFs bound to this driver.

For vGPU instances, expose the firmware-selected device and subsystem
IDs through configuration-space reads and constrain BAR1 region reporting,
read, write, and mmap access to the assigned vGPU type's aperture.
Coordinate firmware reset through PCI reset callbacks and serialize the
entire reset window against instance open and close without retaining a
mutex across a multi-device bus reset. Latch firmware reset failures
until successful reopen, report them through the VFIO error IRQ and
reset ioctls, and preserve core configuration-write return values.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/vfio/pci/Kconfig              |   2 +
 drivers/vfio/pci/Makefile             |   2 +
 drivers/vfio/pci/nvidia-vgpu/Kconfig  |  21 ++
 drivers/vfio/pci/nvidia-vgpu/Makefile |   2 +
 drivers/vfio/pci/nvidia-vgpu/main.c   | 509 ++++++++++++++++++++++++++
 5 files changed, 536 insertions(+)
 create mode 100644 drivers/vfio/pci/nvidia-vgpu/Kconfig
 create mode 100644 drivers/vfio/pci/nvidia-vgpu/Makefile
 create mode 100644 drivers/vfio/pci/nvidia-vgpu/main.c

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 296bf01e185e..b48d8d1af42a 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -74,4 +74,6 @@ source "drivers/vfio/pci/qat/Kconfig"
 
 source "drivers/vfio/pci/xe/Kconfig"
 
+source "drivers/vfio/pci/nvidia-vgpu/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index 6138f1bf241d..f3498e541555 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -24,3 +24,5 @@ obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
 
 obj-$(CONFIG_XE_VFIO_PCI) += xe/
+
+obj-$(CONFIG_NVIDIA_VGPU_VFIO_PCI) += nvidia-vgpu/
diff --git a/drivers/vfio/pci/nvidia-vgpu/Kconfig b/drivers/vfio/pci/nvidia-vgpu/Kconfig
new file mode 100644
index 000000000000..e7791fa79984
--- /dev/null
+++ b/drivers/vfio/pci/nvidia-vgpu/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config NVIDIA_VGPU_VFIO_PCI
+	tristate "VFIO support for the NVIDIA vGPU"
+	depends on NOVA_CORE && PCI_IOV
+	select VFIO_PCI_CORE
+	help
+	  This option enables VFIO (Virtual Function I/O) support for
+	  NVIDIA virtual GPUs (vGPU). It allows the assignment of a virtual
+	  GPU instance to userspace applications via VFIO, typically used
+	  with hypervisors such as KVM and device emulators like QEMU.
+
+	  Devices without an available Nova vGPU interface use ordinary PCI
+	  passthrough. Both paths use the VFIO PCI core defaults; vfio-pci
+	  module options do not apply. The enable_sriov parameter of this
+	  driver controls SR-IOV configuration for PFs bound to it.
+
+	  The NVIDIA vGPU allows a physical GPU to be partitioned into
+	  multiple virtual GPUs, each of which can be passed to a virtual
+	  machine as a PCI device using the standard VFIO infrastructure.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/nvidia-vgpu/Makefile b/drivers/vfio/pci/nvidia-vgpu/Makefile
new file mode 100644
index 000000000000..193cc801a081
--- /dev/null
+++ b/drivers/vfio/pci/nvidia-vgpu/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_NVIDIA_VGPU_VFIO_PCI) += nvidia-vgpu-vfio-pci.o
+nvidia-vgpu-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/nvidia-vgpu/main.c b/drivers/vfio/pci/nvidia-vgpu/main.c
new file mode 100644
index 000000000000..742979fb0ed5
--- /dev/null
+++ b/drivers/vfio/pci/nvidia-vgpu/main.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/compiler.h>
+#include <linux/completion.h>
+#include <linux/minmax.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/pci.h>
+#include <linux/pid.h>
+#include <linux/uaccess.h>
+#include <linux/unaligned.h>
+#include <linux/vfio_pci_core.h>
+#include <drm/nvidia_vgpu.h>
+
+#define NVIDIA_VGPU_DRIVER_NAME "nvidia-vgpu-vfio-pci"
+
+static bool enable_sriov;
+module_param(enable_sriov, bool, 0644);
+MODULE_PARM_DESC(enable_sriov, "Enable SR-IOV configuration for PFs bound to this driver");
+
+static int nvidia_vgpu_fb_bar_index(struct pci_dev *pdev)
+{
+	if (pci_resource_flags(pdev, 0) & IORESOURCE_MEM_64)
+		return 2;
+	return 1;
+}
+
+static const struct rust_ffi_token nvidia_vgpu_ffi_token = {
+	.high = NVIDIA_VGPU_FFI_TOKEN_HIGH,
+	.low = NVIDIA_VGPU_FFI_TOKEN_LOW,
+};
+
+struct nvidia_vgpu_pci_core_device {
+	struct vfio_pci_core_device core_device;
+	struct nvidia_vgpu_type_info type_info;
+	const struct nvidia_vgpu_ops *pf_ops;
+	const void *pf_context;
+	/* Protects lifecycle calls and the active/resetting state. */
+	struct mutex instance_lock;
+	struct completion reset_completion;
+	unsigned int gfid;
+	int reset_error;
+	bool instance_active;
+	bool resetting;
+};
+
+/* Encode the VF's PCI segment:bus:device.function as a 32-bit address. */
+static inline unsigned int nvidia_vgpu_vf_sbdf(struct pci_dev *vf)
+{
+	return ((u32)pci_domain_nr(vf->bus) << 16) | pci_dev_id(vf);
+}
+
+/* Keep open and close outside the complete prepare/PCI-reset/done window. */
+static void nvidia_vgpu_lock_instance(struct nvidia_vgpu_pci_core_device *nvdev)
+{
+	for (;;) {
+		mutex_lock(&nvdev->instance_lock);
+		if (!nvdev->resetting)
+			return;
+		mutex_unlock(&nvdev->instance_lock);
+		wait_for_completion(&nvdev->reset_completion);
+	}
+}
+
+static int nvidia_vgpu_open_device(struct vfio_device *core_vdev)
+{
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+			     core_device.vdev);
+	struct pci_dev *vf = to_pci_dev(core_vdev->dev);
+	struct nvidia_vgpu_type_info type_info;
+	int ret;
+
+	ret = vfio_pci_core_enable(&nvdev->core_device);
+	if (ret)
+		return ret;
+
+	nvidia_vgpu_lock_instance(nvdev);
+	ret = nvdev->pf_ops->open(nvdev->pf_context, nvdev->gfid,
+				 nvidia_vgpu_vf_sbdf(vf), task_tgid_nr(current),
+				 &type_info);
+	if (!ret) {
+		nvdev->instance_active = true;
+		WRITE_ONCE(nvdev->reset_error, 0);
+	}
+	mutex_unlock(&nvdev->instance_lock);
+	if (ret) {
+		vfio_pci_core_disable(&nvdev->core_device);
+		return ret;
+	}
+
+	nvdev->type_info = type_info;
+	put_unaligned_le16(type_info.pci_dev_id,
+			   nvdev->core_device.vconfig + PCI_DEVICE_ID);
+	pci_dbg(vf, "vgpu open: dev_id=0x%x subsys_id=0x%x bar1_length=0x%llx\n",
+		type_info.pci_dev_id, type_info.pci_subsys_id,
+		type_info.bar1_length);
+	vfio_pci_core_finish_enable(&nvdev->core_device);
+	return 0;
+}
+
+static void nvidia_vgpu_close_device(struct vfio_device *core_vdev)
+{
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+			     core_device.vdev);
+
+	nvidia_vgpu_lock_instance(nvdev);
+	nvdev->instance_active = false;
+	nvdev->pf_ops->close(nvdev->pf_context, nvdev->gfid);
+	mutex_unlock(&nvdev->instance_lock);
+	vfio_pci_core_close_device(core_vdev);
+}
+
+static int nvidia_vgpu_bar1_size(struct nvidia_vgpu_pci_core_device *nvdev,
+				 u64 *size)
+{
+	struct pci_dev *pdev = nvdev->core_device.pdev;
+	u64 physical_size = pci_resource_len(pdev, nvidia_vgpu_fb_bar_index(pdev));
+
+	/* The assigned vGPU type reports its VRAM aperture in MiB. */
+	if (check_shl_overflow(nvdev->type_info.bar1_length, 20, size))
+		return -EOVERFLOW;
+
+	/* An unspecified or larger vGPU type aperture uses the physical limit. */
+	if (!*size || *size > physical_size)
+		*size = physical_size;
+
+	return 0;
+}
+
+/* Enforce the same vGPU type aperture reported by GET_REGION_INFO. */
+static int nvidia_vgpu_bar1_access(struct vfio_device *core_vdev,
+				   loff_t pos, size_t *count)
+{
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+			     core_device.vdev);
+	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(pos);
+	u64 size;
+	int ret;
+
+	if (!*count || index != nvidia_vgpu_fb_bar_index(nvdev->core_device.pdev))
+		return 0;
+
+	ret = nvidia_vgpu_bar1_size(nvdev, &size);
+	if (ret)
+		return ret;
+
+	pos &= VFIO_PCI_OFFSET_MASK;
+	if (pos >= size)
+		return -EINVAL;
+
+	*count = min_t(u64, *count, size - pos);
+	return 0;
+}
+
+static ssize_t nvidia_vgpu_read_config(struct vfio_device *core_vdev,
+				      char __user *buf, size_t count,
+				      loff_t *ppos)
+{
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+			     core_device.vdev);
+	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
+	loff_t next = *ppos, copy_offset;
+	size_t copy_count, register_offset;
+	__le16 value;
+	ssize_t ret;
+
+	ret = vfio_pci_core_read(core_vdev, buf, count, &next);
+	if (ret <= 0)
+		return ret;
+
+	/* The core reads the subsystem ID from physical configuration space. */
+	if (vfio_pci_core_range_intersect_range(pos, ret, PCI_SUBSYSTEM_ID,
+					      sizeof(value), &copy_offset,
+					      &copy_count, &register_offset)) {
+		value = cpu_to_le16(nvdev->type_info.pci_subsys_id);
+		if (copy_to_user(buf + copy_offset,
+				(u8 *)&value + register_offset, copy_count))
+			return -EFAULT;
+	}
+
+	*ppos = next;
+	return ret;
+}
+
+static ssize_t nvidia_vgpu_pci_read(struct vfio_device *core_vdev,
+				    char __user *buf, size_t count,
+				    loff_t *ppos)
+{
+	int ret;
+
+	if (VFIO_PCI_OFFSET_TO_INDEX(*ppos) == VFIO_PCI_CONFIG_REGION_INDEX)
+		return nvidia_vgpu_read_config(core_vdev, buf, count, ppos);
+
+	ret = nvidia_vgpu_bar1_access(core_vdev, *ppos, &count);
+	if (ret)
+		return ret;
+
+	return vfio_pci_core_read(core_vdev, buf, count, ppos);
+}
+
+static ssize_t nvidia_vgpu_pci_write(struct vfio_device *core_vdev,
+				     const char __user *buf, size_t count,
+				     loff_t *ppos)
+{
+	int ret;
+
+	ret = nvidia_vgpu_bar1_access(core_vdev, *ppos, &count);
+	if (ret)
+		return ret;
+
+	/* Reset callbacks report a firmware FLR failure through the error IRQ. */
+	return vfio_pci_core_write(core_vdev, buf, count, ppos);
+}
+
+static int nvidia_vgpu_pci_mmap(struct vfio_device *core_vdev,
+				struct vm_area_struct *vma)
+{
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+			     core_device.vdev);
+	unsigned int index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
+	u64 size, req_start, req_len, end;
+	int ret;
+
+	if (index != nvidia_vgpu_fb_bar_index(nvdev->core_device.pdev))
+		return vfio_pci_core_mmap(core_vdev, vma);
+
+	ret = nvidia_vgpu_bar1_size(nvdev, &size);
+	if (ret)
+		return ret;
+
+	req_start = (vma->vm_pgoff & (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT)) << PAGE_SHIFT;
+	if (check_sub_overflow(vma->vm_end, vma->vm_start, &req_len) ||
+	    check_add_overflow(req_start, req_len, &end))
+		return -EOVERFLOW;
+	if (end > size)
+		return -EINVAL;
+
+	return vfio_pci_core_mmap(core_vdev, vma);
+}
+
+static int nvidia_vgpu_get_region_info(struct vfio_device *core_vdev,
+				       struct vfio_region_info *info,
+				       struct vfio_info_cap *caps)
+{
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+	int ret;
+
+	ret = vfio_pci_ioctl_get_region_info(core_vdev, info, caps);
+	if (ret)
+		return ret;
+
+	if (info->index == nvidia_vgpu_fb_bar_index(pdev) && info->size) {
+		struct nvidia_vgpu_pci_core_device *nvdev =
+			container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+				     core_device.vdev);
+		u64 vgpu_bar1;
+
+		ret = nvidia_vgpu_bar1_size(nvdev, &vgpu_bar1);
+		if (ret)
+			return ret;
+
+		if (vgpu_bar1 && vgpu_bar1 < info->size)
+			info->size = vgpu_bar1;
+	}
+
+	return 0;
+}
+
+static long nvidia_vgpu_pci_ioctl(struct vfio_device *core_vdev,
+				  unsigned int cmd, unsigned long arg)
+{
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_vdev, struct nvidia_vgpu_pci_core_device,
+			     core_device.vdev);
+	bool reset = cmd == VFIO_DEVICE_RESET || cmd == VFIO_DEVICE_PCI_HOT_RESET;
+	long ret;
+
+	/* A failed firmware reset requires closing and reopening the instance. */
+	if (reset && READ_ONCE(nvdev->reset_error))
+		return READ_ONCE(nvdev->reset_error);
+
+	ret = vfio_pci_core_ioctl(core_vdev, cmd, arg);
+	if (ret)
+		return ret;
+
+	if (reset)
+		return READ_ONCE(nvdev->reset_error);
+
+	return 0;
+}
+
+static void nvidia_vgpu_reset_prepare(struct pci_dev *pdev)
+{
+	struct vfio_pci_core_device *core_device = dev_get_drvdata(&pdev->dev);
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_device, struct nvidia_vgpu_pci_core_device,
+			     core_device);
+	int ret = 0;
+
+	/*
+	 * PCI holds the VF device lock, and VFIO may hold its memory lock.
+	 * Open and close release instance_lock before entering vfio-pci-core;
+	 * PF operations take only GPU locks, never the PF or VF device lock.
+	 */
+	mutex_lock(&nvdev->instance_lock);
+	nvdev->resetting = true;
+	reinit_completion(&nvdev->reset_completion);
+	if (nvdev->instance_active)
+		ret = nvdev->pf_ops->reset(nvdev->pf_context, nvdev->gfid);
+	if (ret && !nvdev->reset_error)
+		WRITE_ONCE(nvdev->reset_error, ret);
+	mutex_unlock(&nvdev->instance_lock);
+}
+
+static void nvidia_vgpu_reset_done(struct pci_dev *pdev)
+{
+	struct vfio_pci_core_device *core_device = dev_get_drvdata(&pdev->dev);
+	struct nvidia_vgpu_pci_core_device *nvdev =
+		container_of(core_device, struct nvidia_vgpu_pci_core_device,
+			     core_device);
+	int ret;
+
+	mutex_lock(&nvdev->instance_lock);
+	ret = nvdev->reset_error;
+	/* PCI reset callbacks cannot return an error or abort the PCI reset. */
+	if (ret) {
+		pci_err(pdev, "vGPU instance has a failed firmware reset: %d\n", ret);
+		vfio_pci_core_aer_err_detected(pdev, pci_channel_io_normal);
+	}
+	nvdev->resetting = false;
+	complete_all(&nvdev->reset_completion);
+	mutex_unlock(&nvdev->instance_lock);
+}
+
+static const struct pci_error_handlers nvidia_vgpu_err_handlers = {
+	.error_detected = vfio_pci_core_aer_err_detected,
+	.reset_prepare = nvidia_vgpu_reset_prepare,
+	.reset_done = nvidia_vgpu_reset_done,
+};
+
+static const struct vfio_device_ops nvidia_vgpu_pci_ops = {
+	.name		= NVIDIA_VGPU_DRIVER_NAME,
+	.init		= vfio_pci_core_init_dev,
+	.release	= vfio_pci_core_release_dev,
+	.open_device	= nvidia_vgpu_open_device,
+	.close_device	= nvidia_vgpu_close_device,
+	.ioctl		= nvidia_vgpu_pci_ioctl,
+	.get_region_info_caps = nvidia_vgpu_get_region_info,
+	.device_feature	= vfio_pci_core_ioctl_feature,
+	.read		= nvidia_vgpu_pci_read,
+	.write		= nvidia_vgpu_pci_write,
+	.mmap		= nvidia_vgpu_pci_mmap,
+	.request	= vfio_pci_core_request,
+	.match		= vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd	= vfio_iommufd_physical_bind,
+	.unbind_iommufd	= vfio_iommufd_physical_unbind,
+	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
+	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
+	.pasid_attach_ioas = vfio_iommufd_physical_pasid_attach_ioas,
+	.pasid_detach_ioas = vfio_iommufd_physical_pasid_detach_ioas,
+};
+
+static int nvidia_vgpu_passthrough_open(struct vfio_device *core_vdev)
+{
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+	return 0;
+}
+
+/* PFs and VFs without a compatible Nova interface retain generic VFIO behavior. */
+static const struct vfio_device_ops nvidia_vgpu_passthrough_ops = {
+	.name		= NVIDIA_VGPU_DRIVER_NAME,
+	.init		= vfio_pci_core_init_dev,
+	.release	= vfio_pci_core_release_dev,
+	.open_device	= nvidia_vgpu_passthrough_open,
+	.close_device	= vfio_pci_core_close_device,
+	.ioctl		= vfio_pci_core_ioctl,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
+	.device_feature	= vfio_pci_core_ioctl_feature,
+	.read		= vfio_pci_core_read,
+	.write		= vfio_pci_core_write,
+	.mmap		= vfio_pci_core_mmap,
+	.request	= vfio_pci_core_request,
+	.match		= vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd	= vfio_iommufd_physical_bind,
+	.unbind_iommufd	= vfio_iommufd_physical_unbind,
+	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
+	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
+	.pasid_attach_ioas = vfio_iommufd_physical_pasid_attach_ioas,
+	.pasid_detach_ioas = vfio_iommufd_physical_pasid_detach_ioas,
+};
+
+static const struct vfio_pci_device_ops nvidia_vgpu_passthrough_dev_ops = {
+	.get_dmabuf_phys = vfio_pci_core_get_dmabuf_phys,
+};
+
+static int nvidia_vgpu_pci_probe(struct pci_dev *pdev,
+				 const struct pci_device_id *id)
+{
+	const struct vfio_device_ops *device_ops = &nvidia_vgpu_passthrough_ops;
+	struct nvidia_vgpu_pci_core_device *nvdev;
+	const struct nvidia_vgpu_ops *pf_ops = NULL;
+	const void *pf_context = NULL;
+	int vf_id = -1;
+	int ret;
+
+	if (pdev->is_virtfn) {
+		const struct rust_ffi *ffi;
+
+		ffi = pci_iov_borrow_rust_pf_data(pdev, &nvidia_vgpu_ffi_token,
+						  NVIDIA_VGPU_FFI_ABI_MAJOR,
+						  NVIDIA_VGPU_FFI_ABI_MINOR,
+						  sizeof(*pf_ops));
+		if (!IS_ERR(ffi)) {
+			const struct nvidia_vgpu_ops *ops = ffi->ops;
+
+			if (ops->open && ops->close && ops->reset) {
+				pf_ops = ops;
+				pf_context = ffi->context;
+				device_ops = &nvidia_vgpu_pci_ops;
+			}
+		}
+	}
+
+	if (pf_ops) {
+		vf_id = pci_iov_vf_id(pdev);
+		if (vf_id < 0)
+			return vf_id;
+	}
+
+	nvdev = vfio_alloc_device(nvidia_vgpu_pci_core_device, core_device.vdev,
+				  &pdev->dev, device_ops);
+	if (IS_ERR(nvdev))
+		return PTR_ERR(nvdev);
+
+	mutex_init(&nvdev->instance_lock);
+	init_completion(&nvdev->reset_completion);
+	nvdev->pf_ops = pf_ops;
+	nvdev->pf_context = pf_context;
+	nvdev->gfid = vf_id + 1;
+	if (!pf_ops)
+		nvdev->core_device.pci_ops = &nvidia_vgpu_passthrough_dev_ops;
+	dev_set_drvdata(&pdev->dev, &nvdev->core_device);
+	ret = vfio_pci_core_register_device(&nvdev->core_device);
+	if (ret)
+		goto out_put_vdev;
+
+	return 0;
+
+out_put_vdev:
+	vfio_put_device(&nvdev->core_device.vdev);
+	return ret;
+}
+
+static void nvidia_vgpu_pci_remove(struct pci_dev *pdev)
+{
+	struct vfio_pci_core_device *core_device = dev_get_drvdata(&pdev->dev);
+
+	/* Drain all VFIO callbacks before the borrowed PF context expires. */
+	vfio_pci_core_unregister_device(core_device);
+	vfio_put_device(&core_device->vdev);
+}
+
+static const struct pci_device_id nvidia_vgpu_pci_table[] = {
+	/* RTX PRO 6000 Blackwell Server Edition PFs and VFs share this ID. */
+	{ PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_NVIDIA, 0x2bb5),
+	  .class = PCI_CLASS_DISPLAY_3D << 8, .class_mask = 0xffff00 },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, nvidia_vgpu_pci_table);
+
+static int nvidia_vgpu_sriov_configure(struct pci_dev *pdev, int nr_virtfn)
+{
+	struct vfio_pci_core_device *vdev = dev_get_drvdata(&pdev->dev);
+
+	if (!enable_sriov)
+		return -ENOENT;
+
+	return vfio_pci_core_sriov_configure(vdev, nr_virtfn);
+}
+
+static struct pci_driver nvidia_vgpu_pci_driver = {
+	.name		= NVIDIA_VGPU_DRIVER_NAME,
+	.id_table	= nvidia_vgpu_pci_table,
+	.probe		= nvidia_vgpu_pci_probe,
+	.remove		= nvidia_vgpu_pci_remove,
+	.sriov_configure = nvidia_vgpu_sriov_configure,
+	.err_handler	= &nvidia_vgpu_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(nvidia_vgpu_pci_driver);
+
+MODULE_DESCRIPTION("NVIDIA vGPU vfio-pci driver");
+MODULE_LICENSE("GPL");
