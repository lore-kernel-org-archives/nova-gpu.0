Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012029.outbound.protection.outlook.com [40.93.195.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04E5477981
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505886; cv=fail; b=AaVLEbIIbqi75zwGonXyU3rmvvkobfYQNybrEErRBeaGfGFTF8+bD4hZZgLXViKlQKrPNQc6JeXuSyef/6Np36VQesGM1TYbFVd/XZn+27hR6k2/HRLYkRRDy7pmyoOqH6STmTdHJWDfdfMhuqvbSJcpQg1wLxKg792Z6hLRes0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505886; c=relaxed/simple;
	bh=AnpRuMZOJ0sN3lGyNAogiWnmCT2arJ4eNJIqgxVScbM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+CCEDNv1ls0upEfAANR0jRiWlL3hivuAn6EXs4/uiqN1G8DHfT4SqIjdUqDPG6HwCJkKgCgA7rsUbe74Kshx3kPEEzEtUtzdxkVOIjrE2Aa00F80gi8ySXHc7I9Cuya5s8kEp5odU74xzpoYx03U4FFSWVTNfkSb1mDS0oF3mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lJjsyhGY; arc=fail smtp.client-ip=40.93.195.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lJjsyhGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDzOFl8aPgoYKpqKAsWtGaK9ndINl7sXVlbrvH38k2ABpx9DdOPMPd2Cbfp0w+FzB5e2LDT3XdJ8Pt5h4otOkU7vWmWctAVcbeMxoUWPpcc32n/RAWzn0XePlZKbOPJH7bNqCgvxQojIZbrsGyRa2zssVG3O1JyjSkpUcpmATzsNF0G2RYU4WCEYCELsacfmzGJjtYE5gtx2JA6AlkspmjLiNcnEOvbEXKdWYlhap4uEsrKpFD28Tvuqx/yapY52WttXnQ3sxcKyX4MG9OdntbV4wI89Os/IhbA4U4ht7yC3vFDzMRaV7km2pWiVSE5s82p11pT/FUTj/XEtNTDVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfbZRefirlZO/d9Hb8/3uiPeg7dxv3G6HDySXVE5Vgk=;
 b=OgQ7xlzc4Gi0vxkGwGm0l7CcpZET33DNC5XgVE16WT5t13J63XYZU+RFh9ElQwz2reUK3OLI2Gpp4zx0KbTq2rQhrNOD4vj4LseSMUiIupXgnKGwPDUs4hkJ8od8cbWmjbzsc7SFOAtk+4FXfE24Avohg+FQ7GuOy47SIIufYnYEEmHUXCnON8iLF3XODhngHtl1JMuK3gbMCYrbNzgMvAHZEx1LtLlN4N8unasBSE//M5E+VFWpUnwGzbTrM/1c1waD+ObfPQv+yUoDc2OmdYtFf2lu3DFa4QC2hOXJ9vbFz4Ll9YGygf3y5iX7xTXHPhXvMdmrSiIy8sAw00Z8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfbZRefirlZO/d9Hb8/3uiPeg7dxv3G6HDySXVE5Vgk=;
 b=lJjsyhGYcVW3NU3xwlUrxR9XvBRf0iqgc9yVkoZqENkWXt8Qg3A0ucT6KB8Wpp1L/rOXETTALZz8tAy8uAy/TqCkHIoOPu0Ab2IH62dnhCIy9iPW80izuxZnmRnIl+WCmtNIRq/8yMvtZNit+PGnh/jrvWcSCc8NWDmN8OfkrHSvbBnhCqKtBSg/orJ/7SVSh23m8KOkOecB+BJtCmcT9mhSNceXnl9NdZL072jCKHxDmP3By0T1bfdDtDhsX857fnhRnkB1CPMvyakidMw3wimZP/zKcxdyLobs8uF/YigwFKTH1Oi9abzo3yjITZuIzbudk7/4vxPe/dAIgLUSiw==
Received: from BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::8)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Tue, 15 Sep
 2026 20:58:00 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::10) by BY1P220CA0018.outlook.office365.com
 (2603:10b6:a03:5c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:57:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:40 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:40 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:33 -0700
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
Subject: [PATCH 04/14] rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
Date: Tue, 15 Sep 2026 23:56:48 +0300
Message-ID: <20260915205659.76841-5-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 895487ba-56da-4d04-57df-08df136c0672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rSDQ8fZ7PlJJRQjwp+XIAXUvBQSGDVonPDQhCypM7yK8FPgUQ5bhEl9E5FRDG6oY6OMWG67GkWnSRChmvXkDsaaEOU4dS/mh5YaokmdjBdXJ1PcN/pjkGcqtNFcP6d25C7IA7FXZZQMd1MzwojEwAg9CcjSSLFYUwFjd2HsDY+X3rz6KAVMPYCxQp8PWzOItngjbtZwQFS8WtBgC5eSAQkFmgf9ngY2brkt1hD0JUC6NvsmELJHDtN/lPetMtMrzQRKTGxuMsPoZKZvlnWwB+QWDIUP4KTqLEe2RmsUI3a2YIpACtaacDtTXH7ivviC+mF33JRzAns20Fx9pHGxbfYEQ1nTgIYMsI1WcnYjTg1Diaw68ZCTj6+2maBWV5r3usxqEJwk6Xx/4b1DI9CxAtvOpRwWLgBvK40WhpR7DNNZ1AsKZfBJgHCCJEhaJg4+WYfs9NyEILhm7SBPISiJTQsNDakLjKVNtLYm0YAbdkRiU2iooAa/PGdzgQfKlcIffxTP3F0+9hnACx4MOKW1azt2UqdSWOrEEICW5MGUQJcZt7bzXDwATwnTX8lZhsPJGEiDP2kMUl+wGNbA8PKM6bCDF5rbVuZfz6YT1076oEeiH7xI8gtcmWbh9zQfJ423zJGH6Dk/g/B3hcGqi17X5TD04Fzc8KzuSabQ/kBXgai4AWht6vtc5z4lfux++O8t0bBjoSpY9k4F70tnNsgKyaQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	svKW+GPyqJrIZQke0CyKvYUQKpXJvMHf/Page8sY9TPTnkL6D4jFxCV7M54ESXS13ABe9V2LgNcP4zk1LmAT4vth2H44/01J8iZgNsFuN2UckFAk6oBSRFiBn90GikH6qc0d8J0IqB3d+aOBIqg3gxfl2bGLkTpr+wySNtfbCD2J/0zIx19ibsPgLMYHk1kwCFGtZWZ6rEkh4m8wLnc7wo9TYgqOLC3VDfJSUBWkpabcDOPJFANKs+o/oqbOQxazAHhs+kkkhz/odyiuc9JV4n02Un6PyybXUiTCXzGSKApPZXZrGUKitC7JjLxZGkVfSNVgikwUKKE6/c3cOj4lASKsKHTqLgYgPsWGd9ZJXB3LZN960sMBbh7AiiknscRGGeFtQ1H5Bmoi10N6bpXGsg6BY67lvKr3LHcv3Bgm0ftCNt8M7e8VfxKHkUCbQnfr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:57:59.4546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 895487ba-56da-4d04-57df-08df136c0672
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433

From: Peter Colberg <pcolberg@redhat.com>

Add an optional bus callback sriov_configure() to pci::Driver trait,
using the vtable attribute to query if the driver implements the
callback. The callback is invoked when a user-space application
writes the number of VFs to the sysfs file `sriov_numvfs` to
enable SR-IOV, or zero to disable SR-IOV for a PCI device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 rust/kernel/pci.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 24b682d4d6da..7f50c1c96a4f 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -94,6 +94,10 @@ unsafe fn register(
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
             (*pdrv.get()).managed_sriov = true;
+            #[cfg(CONFIG_PCI_IOV)]
+            if T::HAS_SRIOV_CONFIGURE {
+                (*pdrv.get()).sriov_configure = Some(Self::sriov_configure_callback);
+            }
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -150,6 +154,20 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
 
         T::unbind(pdev, data);
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    extern "C" fn sriov_configure_callback(
+        pdev: *mut bindings::pci_dev,
+        nr_virtfn: c_int,
+    ) -> c_int {
+        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
+        // a `struct pci_dev`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal<'_>>>() };
+
+        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+    }
 }
 
 /// Declares a kernel module that exposes a single PCI driver.
@@ -336,6 +354,44 @@ fn probe<'bound>(
     fn unbind<'bound>(dev: &'bound Device<device::Core<'_>>, this: Pin<&Self::Data<'bound>>) {
         let _ = (dev, this);
     }
+
+    /// Single Root I/O Virtualization (SR-IOV) configure.
+    ///
+    /// Called when a user-space application enables or disables the SR-IOV capability for a
+    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
+    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    ///
+    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
+    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
+    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
+    /// driver, the underlying PF device is bound to a driver, too.
+    ///
+    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
+    /// SR-IOV was disabled.
+    ///
+    /// See [PCI Express I/O Virtualization].
+    ///
+    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci, prelude::*};
+    /// #[cfg(CONFIG_PCI_IOV)]
+    /// fn sriov_configure(dev: &pci::Device<Core<'_>>, nr_virtfn: i32) -> Result<i32> {
+    ///     if nr_virtfn == 0 {
+    ///         dev.disable_sriov();
+    ///     } else {
+    ///         dev.enable_sriov(nr_virtfn)?;
+    ///     }
+    ///     Ok(nr_virtfn)
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure(dev: &Device<device::Core<'_>>, nr_virtfn: i32) -> Result<i32> {
+        let _ = (dev, nr_virtfn);
+        build_error!(crate::error::VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// The PCI device representation.
