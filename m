Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAE2D73A0
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158695; cv=fail; b=PV4qnEJwUryMMf7WaTgOa9PYY1Y0ZRSNG2wnjAZUWcy3wWcJogRtuXXVdm9d/DOSMzxXgwJ3R2LzOkZb5JKu8q+TWsvZR/9TDNdXysDVsAvNL8o/33qR7hu4aFspxsPwgkLJg14ZyYFn+h1xJksA9foT5/rLI9+AnJ72i6Zbm98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158695; c=relaxed/simple;
	bh=fpljWYF8QtgdsWnsIS9EeoHhyzskLuChnSgdLi/hZRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sOk2tAmdRZwb6arX3roWtyHG7UKVDCWji7B9/2kzG43OPIJ+2AsHcRYVlUOPCIMtdWA1dQM5CscI0h1SDfnb50bThgwybJsPJS/SEITnM6+1XMk6SlL+9bbg6pXU6N/t0OmhgZ3VBq/Dhv/BHv8+r5FV/bZdyJqPWkNEbVHcNGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WvpF/xUu; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WvpF/xUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqyInxEszjyUcpmRNjF23Q6ePCPtmvreacXbs/YJqxIFcj6byCQThnUJMrwh4njTTGaBCNWSYCGCyUZaNtwNy86xBzAOrNHXQfCM845NHf88mp5R73MStWPwDM7nmMOWaG1aXxku86YPDABaECdJ9aF+zBQa14+QchqgxQJWyF63J7Q4Y7ye1JX+g59PZqrOJDi9pNDbR5wDTGhiEqstZfCuijTCYqyl/xpb0G15rJ07leIbF+iEesaZF7iHYzFqeHjHpMipp+hrvxVEQTlsfThYHdGqXlfnYtc751f0ZtjdtKOcbRSwHzeAMLRp0RS42V86sbK4mtiYN5tm8hJScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvhPW9Owio7hC33Pa+tHDUC0Tg3274OS+AgM875laDg=;
 b=pvSCCW4+P9Ee7NlqT1hCMmm5B4LxeqWhmnxmiMVPVBxSHOGsahMBXVmCnhQn/zPPpxX/0Z4qMReOqkIWnSGzExjiID9qUXtVqZlbE+jS4aJI5E45D+g6twNxbkchf8PqR+hMjjWorAYFC4LIW/OET+Eu++58jkXwyS9b8eT6/Rs90kA5i2yPXN7EWk1iygHj3V34OUyKUFN0h/tgSHWpNHwiNOV/Sx3/sq7vftV69xDnIlTH+9ZnXVMSM2HEp2BNrjTlVjdpKrU3CYcTzK+NzGnTWqDo/tpqyvSvHRpUr71NcrORA1YkHqeJtWIXHnWOIoZPF2Vpd1fdrDpd12hpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvhPW9Owio7hC33Pa+tHDUC0Tg3274OS+AgM875laDg=;
 b=WvpF/xUu4MIz20qanIT9V+MuPPAaIBFTlAa3bXNW2YvqkowZEUDgcrjf0BmFYqEmryru2oBJ1OSLlshFojY0AJKlCA1PPUPEJauC/N0tv9AAJ/tdJZZGVXtEHL8uFIZdT10GV/6+qarZjuDxThcqBjeC6lI0RdUbi7wcPTrTuu3lhoYuiHyUHNVVFy3uR5XO8WxrPb0xIt1dqqpO6Dco6LiArzgwlk2N2xvKUQHIESNJ3w62kFzlcfTdVBP2ylz6psAGLmJXoufuR7TW9jAcqtrMI6SXMtRbN205P4D4r/Hr8AgbpMacLroizsbUENcuwuwcPpbo5EJtZ9Mn6+nhVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:25 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 03/17] rust: pci: expose the allocated interrupt type
Date: Fri,  7 Aug 2026 20:11:05 -0700
Message-ID: <20260808031120.363869-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 1754a4e0-3821-4947-e2e6-08def4fabb4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jxzxDpwZnFH9lqao9hrIJ3efgsiH5WOhGqH6KnOrgbE4VvTpW9lMDuoBvaPtl0U12i1F1XQ536COsy0ewnzgCAy7i8HEUWMGaDSi0goPoRbxSl5UtPCzJo9lmEammrPzlPPqH6K50EN4fMgG6opagSFHch779LG/dv0YvLIJq4L19tI2BjZsF64oNj203itHNtRoL5Xy0DOjMdFpYoGCSUcr+QuuTGQ/1sQFaGvXZPEqZdb8pdXg3/8CFWhR000TX/S+2sgoBL386mqy97RIYmzeFsnDogxpfuQXEh4EDsE0FlmMDwH/2gxHUQKnNp7cnAGEXZs0166ugA1d1nswPL3LMpdjdMIZMvp2X2rCwAbrAsyV6yv1GrX2FEEQ9+mvnA1ygXxASCnLukTmbVSo70sJvnSYNzzrUljnNPNfcx9r5kTB/9PodMMRXerGDG/A0kJxLfT25Lhr15sefe0rHnCbKor26vvC2agQjudeuwOCmtziUBcK0gtsJ+9z4iYKkZDQpPpPNkoP0i9Zre+cAmjG9hdtv43GtkK8L+t0ZqnvMaUdsrqqQfzultXoQNCH9nmTgsYVc6xHVYHIpfdpUTchkJAA3hi278oaOiWL86wCTbjoi9Dcv7f7iLmOmqfEDVJuOeHliqxgWkkhv9BGnUkxw4gId4ydFV9GmbuUoRM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?38aYkC/uzdczRuIhkWjxYagt74EDJSrxSGBixlTnjq58lv40XggetCeMY4mO?=
 =?us-ascii?Q?NomPf1S3suxNPMKCiU0TakCdayPeEPYGnq5epOQragKshIQe2/iK4st2LY8U?=
 =?us-ascii?Q?xUoZVrY3WzpRQtH4Qqw5N/Cn+nEKN2kWqGMjIjfZ5CZtgsQTdTOwby+3guFW?=
 =?us-ascii?Q?DgorcQXrLokMTUGvWsA0GdU5r8hNcdUfcn0YsMa64RjvC6+ss9byS1+YmNa1?=
 =?us-ascii?Q?3Olh8fbGzzGpkdedb9ZnMK70CxBWYlYoSFElLkRVfI0uFEgC5ywA/7BVILZ4?=
 =?us-ascii?Q?eD0BxyU98rNTZF/WbagNiIY8LrqO+w7/2HdOGBEmlj8jVLEd7r1vP1JPn7pz?=
 =?us-ascii?Q?JrsE69AKJ1vvap+piTHC6dp4ZXoRhqPEwwlT2wSCAxz2A8qxy30zNiSckU9u?=
 =?us-ascii?Q?an8GB0lRmg8yrbxQlMAr8R2B99c4fiDiD6Mdu9O3sUcIeyUBXrIxfwxAtQ+u?=
 =?us-ascii?Q?Tb3XYkLqahCoizgRHF6JYE4yQHYk8LV9xGdy5pSB5sSqGtiHtyhksECtFuIZ?=
 =?us-ascii?Q?NRVOXu3FcOS4x3+tXTnFRiiEslzQkpauCMT+azytIwrmMa9E3vDfLocfympg?=
 =?us-ascii?Q?ZnYGXMuGKo6z++DzsoNDONg4ypy7ePrXvAxEGNFiww5UwCBl7KB7rR9N7ahP?=
 =?us-ascii?Q?8mLL11rpFz3pDUK/ISFBj9ehaf5R0M44Ko9zktvJORJoK7+eUtkmznBYDXkA?=
 =?us-ascii?Q?HoX7oTNXYrDA/qLt7MMwNAuQ1XDJzSX1/zIb7owNJB1wVmOon+IqpU163fRs?=
 =?us-ascii?Q?Sbh6vMtaSe4PtaOGs0TL1q9L220X0K1HTR6XgIJoOxOEc3BgjLui+LgECtm0?=
 =?us-ascii?Q?8lz4e8sa3V+UzDST4vvw3gi+s/p70TuuArv1/DBCQRynjzLNLipXd6MXcQdN?=
 =?us-ascii?Q?ZzCPNQpi3SYrMsoC33X8K8z1UGgXs5CrmyPQHwnP//aFKMXd3tNMl5cBwgOa?=
 =?us-ascii?Q?vaAKp7/vXeivv2ykpxwB74I4oS4ubEZNqYXhFkzY4E23rDTPSWmYauf6FYzC?=
 =?us-ascii?Q?DzNIfpx/WnFq9IufIs9mIdJHUy4chm2Vkm8TbgDyPApxCW6r2nDO7cTTalow?=
 =?us-ascii?Q?eNsj5Bi++lFL2UYzicwahp+zfiI/yc/oAncC7F26AkDOK2qpse/spSkdwK9P?=
 =?us-ascii?Q?HQYIS4QvtvTf6QWRP4qSe171Z1yOgHZ7jSJBpM9iP+FpIx8g/gcbIJsRKdr3?=
 =?us-ascii?Q?iHQMxkuLKG75EyClaoCY42mLq9OHwWUcfMJYTmGUr2KZKlT94mJ88W5UO5EQ?=
 =?us-ascii?Q?mM9LmOJVpRJfbDN0+YcK1YZVWt481W9EhmV9BWasYrhV+tntkeuKwMWYkmSe?=
 =?us-ascii?Q?P7o9WRY3MIMEXRMTkn1aa9ZN52sk1VwQMT0ESPqfYeBQKsU9b76P+DCAsewk?=
 =?us-ascii?Q?Ih4lwN+O06oQptmOLr8bjMJCQFuVhOM31WuutHF64CQJ/gVgughBlpHxldMZ?=
 =?us-ascii?Q?CRgZBn/EaIhNHBQf2XNs3oWOkJO5H7XgmVGbJC4l1rlySg3gPCWS0WxSU8RJ?=
 =?us-ascii?Q?ZkVS1+uJ40FEolTIH6YWgbkjNRa9z0p3B/QqHgj8aCXLcLXbkXOAmTZtYgSl?=
 =?us-ascii?Q?gIbkbSEGUfYIBTS+RQGFRGupbthV/w7/10dhtWlbP+3CITgvDvxR9uCXUw5d?=
 =?us-ascii?Q?oTbY9WYgPymj+wRIfU+sR6/LwzshmX0yUuMQpUBi6/9TQyFsVeo6Oe3PTKgQ?=
 =?us-ascii?Q?COXZk4vJFA+maT2LY++6T55dZpPhFMRF523NxeT1LQkjNcpup4ryR6a8e98n?=
 =?us-ascii?Q?Gbkjc4JiOg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1754a4e0-3821-4947-e2e6-08def4fabb4e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:25.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtNzy2JH07wz8oQPbayPc3iMbpym4Ce8RSTxM8C9zC8meBOKFD6xXuzRfucEdDNQzcACrBOI+py6vl+ldVithA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

A PCI driver can accept INTx, MSI, or MSI-X, and how it acknowledges an
interrupt can depend on which one the PCI core picks. The Rust
abstraction never reported the choice, so a driver had to assume, and
of course a wrong assumption would lead to a broken interrupt delivery
setup.

Report the type that the PCI core selected.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/helpers/pci.c     | 11 +++++++++++
 rust/kernel/pci/irq.rs | 30 ++++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index 4ebf256dff23..87ccd0cec69f 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -24,6 +24,17 @@ __rust_helper bool rust_helper_dev_is_pci(const struct device *dev)
 	return dev_is_pci(dev);
 }
 
+__rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
+{
+	if (pdev->msix_enabled)
+		return PCI_IRQ_MSIX;
+
+	if (pdev->msi_enabled)
+		return PCI_IRQ_MSI;
+
+	return PCI_IRQ_INTX;
+}
+
 #ifndef CONFIG_PCI_IOV
 __rust_helper unsigned int
 rust_helper_pci_sriov_get_totalvfs(struct pci_dev *pdev)
diff --git a/rust/kernel/pci/irq.rs b/rust/kernel/pci/irq.rs
index 66723a43491b..10c728cd139e 100644
--- a/rust/kernel/pci/irq.rs
+++ b/rust/kernel/pci/irq.rs
@@ -100,11 +100,12 @@ fn from(vector: IrqVector<'a>) -> Self {
 ///
 /// # Invariants
 ///
-/// `dev` has an allocation of `count` interrupt vectors.
+/// `dev` has an allocation of `count` interrupt vectors of type `irq_type`.
 #[derive(Clone, Copy)]
 pub struct IrqAllocation<'a> {
     dev: &'a Device<Bound>,
     count: NonZero<u32>,
+    irq_type: IrqType,
 }
 
 impl<'a> IrqAllocation<'a> {
@@ -115,6 +116,15 @@ pub fn count(&self) -> NonZero<u32> {
         self.count
     }
 
+    /// Returns the interrupt type the PCI core selected.
+    ///
+    /// [`Device::alloc_irq_vectors`] takes a set of acceptable types and picks one of them, so a
+    /// driver whose behavior depends on the type asks for it here rather than assuming. Every
+    /// vector of the allocation has this type.
+    pub fn irq_type(&self) -> IrqType {
+        self.irq_type
+    }
+
     /// Resolves the vector at `index` to the Linux IRQ number that delivers it.
     ///
     /// # Errors
@@ -177,9 +187,21 @@ fn register<'a>(
         // `pci_alloc_irq_vectors` returns the number of vectors it allocated.
         let count = NonZero::new(ret as u32).ok_or(EINVAL)?;
 
-        // INVARIANT: `pci_alloc_irq_vectors` allocated `count` vectors for `dev`, numbered
-        // from 0.
-        let vectors = IrqAllocation { dev, count };
+        // SAFETY: `dev.as_raw()` is a valid pointer to a `struct pci_dev`.
+        let irq_type = match unsafe { bindings::pci_irq_type(dev.as_raw()) } {
+            bindings::PCI_IRQ_MSIX => IrqType::MsiX,
+            bindings::PCI_IRQ_MSI => IrqType::Msi,
+            // The helper returns `PCI_IRQ_INTX` when neither MSI nor MSI-X is enabled.
+            _ => IrqType::Intx,
+        };
+
+        // INVARIANT: `pci_alloc_irq_vectors` allocated `count` vectors of `irq_type` for `dev`,
+        // numbered from 0.
+        let vectors = IrqAllocation {
+            dev,
+            count,
+            irq_type,
+        };
 
         // INVARIANT: The IRQ vector allocation for `dev` above was successful.
         let irq_vecs = Self { dev: dev.into() };
-- 
2.55.0

