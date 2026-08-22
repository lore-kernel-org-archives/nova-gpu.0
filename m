Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF9288505
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363708; cv=fail; b=aCmsd8MrE4H7bDtQWD5y9Mli3vCfBkdC9MA/LYEJeXy6FJtwdgbGacrObFSQYCuFwlrGCqV+1wPpBSxpm8E+pfBirZqxVvAKx3LkKFnMqDmd6AAyT5J28Z4NeWg10hVozXV2WOLBZtf6TVsHQJI4s7uvvGEZSsBHE3xFyLS3QIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363708; c=relaxed/simple;
	bh=yod3DDMxq9TicC1tyu2c1VUL9OhTS0eyhUbaAm8U4ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W+nCLf5+5yCGgTbSgo0RUhyW+GiJU+GenG/gQQb9QEJ4AA86oN78wexRYRur1uXc/j2hKpoa/vyme6MohR1EeMfcRbkn5kdwPHAX3QX6JNETk/u3zexEAi19h/cbjhb1krpbjUpl/hBytuCBpUMQVSpxw6kuCS8/V9IWRqaqLzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y3HZ7gql; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y3HZ7gql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHMAZRHYgOrd0up04QSc+36DSIoQnv+l5PMFH3UXOtBIM4SGY37uYRYeCrxrvKEcmYap2Ut3c6/IEt6usH04Sfxi+8I5OdwK1UZbcbKypl7JkS4xYCSKiHHxvbcPhVMf6psk5pDzcYkekVogsVNQUQUpB8MdrJabrzv6l9pCJVRIpy2c/4HRUbgvfJ1E/rsNDkgjRPaJ3hb0hzfhzAGradt3Wd8TaMrgsqPwBc2rtwtWFw6MjnJId0iyqLKG33AVSgl+bl0RBi5ItTNXbK35WmiWh76iKOah3HKGPWVjBqFZpIeDWIEtXOA6IVIymuI7YZNDwmskFLXkPxBulCGm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZEhxrtuX93n9nXZ4Gj4iksKePRxQjB2YGZ0ByoqRec=;
 b=dCVpfa/PPjkOAJD42vn0Yjkmb9oWNnid+k4FcKI5ae64qQ+EI/8DKwwNvJn2R+WE4Au2XNk31/2OP1IElbG5Kx0HabnsvbVtz888gM//4eLalbCs7s7y7PV9D6aTzJHsotwynqsU5iamksYqMdmFAyd6W4a52Or0gWkC70sTBmefZ+fhEEH5plnXFpOLVSpCz0YJ9M5AMy3oULOJYt65ssAm8hR3UoKzJTeuJd5hN19yiAs0griRG5XywmqB7SnIVf7wx+RZ/88JbTfE7IGdwOgyhItDIbFP76eJasE0zH3qGmkO39MWGljXnFKtaKvZ7l+CnOPnFWNaOwTwKvDOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZEhxrtuX93n9nXZ4Gj4iksKePRxQjB2YGZ0ByoqRec=;
 b=Y3HZ7gqlBqaZTgW/frj0JPt9LSlqtyaOg3VpWmRN1SDzxXBs01DBT1oH0Aeo4pSQ3pwpY6s9GpNjiRMa+d37NEyPmgly4JbuVqGFQgHkYG02pOPe3Vd0WqMNs15ttZ4cEsEPuUfNvFlUnQCVjM7aGjNO2P0wohFAgZvVaCWkFfXbwAWsR4hdodG3+FqnnVVk4FgW6pGkTR/iJA52ZubE/F34Dlcvecz0rRlHHCk9NqsN+F9ZeokgVnB/EHAABSIjqIQ7HW+aqNLQhkU1FblDjVqLx2146GY/Iwo+KZn10ThvW2ZWXHfPcyTek+5deWEgRBZH33VuTg2CFpWCJGDS1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:54:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:54:59 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
Subject: [PATCH v2 01/31] rust: pci: add domain_nr() accessor
Date: Fri, 21 Aug 2026 18:54:18 -0700
Message-ID: <20260822015448.238214-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 9918a63d-3b8e-4a8f-0a9f-08defff05f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cyUVPBdbyEKndDTUSpxHra/uHGJTKJej4g+5Hipw6v/D1XkjMSf264bcedYo57RLnEVIbck+HmoqAusV7GlAr/ohAs++QXw2ZMGeXBILgSue2wFXSjQ7x6MNto/38ybdZSvrNbgwmya4gk5bg7v3zs9bmxbKHelO13L2VsEbf0o4BBezGnEL4EhA86D5uqBbJE7cSwitD4T+d6WJbwgM8IK0K+IanbXZ4hduTj6b5fHWS46mf91osciXkmDfMvLbj1VeBERicOytQ6W2P7ml5KlfHdo5Y7FdcXUA73oqSRX2qTGI6uf7ERsJgITLSe/k/0gC/Db4SraMXDP5pmGiWGt7bbokFOsPnD8l2f4GQT+LhAincwMKLCUtwCvWkNHVMPt/oHIjzdaJLjZo8pLmglPFvaHh81hb4pMq0ysM5wws4tFciMr7zph6qt+R52hR/iKEI8PG1V0xgiq4thIo41qBF+kvUH48QfZ6kNaAu8nIxh+8xtqj9Baw9YaKA9f9bzPFm0p2mrv3LOl4HuwWWyqNKUbUeczsKsc3xwUuiG1dV8apHHT+ZMGKJv6JyJtu7WtULw3epys8iWNwR7vlRsAn5fyyumwuqHYs2sTpAAShIuT6u3l3zeripnrnB81Rl5LFtWYrkiysHAI5pGHFeu7DGIsuRn4/jBzCmgcpLnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1P7haEF8iIn5wZTlXVcMsWQPxWQ3yDgTyvSz+Vtnc0MdwW0Q3E2ZZR+M7TMe?=
 =?us-ascii?Q?BUprCCqklPwY7yPxU6XFPUGk3pfn7dRoLF5bSDSon8z8e09Q2ykDbx622ist?=
 =?us-ascii?Q?2Dq6dJjeoY7Z8isCmVkPKBDMPwlw241vQ7+6In1QqLO5x72nEi67t8vAv250?=
 =?us-ascii?Q?JVar4UqbiNKFlNRnrvR1IevaX4JUe49iIWm2IaIdLOpr6+5hiiEe/blEfalL?=
 =?us-ascii?Q?o+ubFQbZHRiFZQdvl2X/cJVKt12o/Gn+ub3Ab3yPC/+7VI1Nh/KPn2Ywsmew?=
 =?us-ascii?Q?q/Gj1Rw0jDWOdhrKVaYudgXupY2ncLTYwSkMV7+6Dg+b11SlFS34S5XnsCR6?=
 =?us-ascii?Q?rbLByvRW+ogpmgH+n4VqWt+7JhtEkpXvIfaHb0jHwHP2MBAjRR0GWPCABRCw?=
 =?us-ascii?Q?JDttx1m/dfDDA+E4vZEV987USlQW8sN3obAWw6DWjEVg9z4OOifBBmVEDPQU?=
 =?us-ascii?Q?+TLXQ0YrKbvZw3h+UdYOfOc/lKxjyuMvmfrl8I24tmeANDEMgRvmHZQAcl8L?=
 =?us-ascii?Q?IPrUu1Wks1MRloYeknBejdi4L9Uk42Y3653KKMd+a4fHWvI0uSAB3RhDImUJ?=
 =?us-ascii?Q?mB4Rfb1e8/BXfl67H+SXjwtMkUyvKM9J8ceHWC042AuLPL3tTJC7KKRWFIVX?=
 =?us-ascii?Q?nfzvKWcfAGjFLZG6wkDroru+Xix6Xs4st0/QKmWUAZ/1ZSrS5A/83t0YOO85?=
 =?us-ascii?Q?CHwR+9cqN/y6LmgqDpgje92MqBtoXX1qzgeYj9SCKl1YMeU0f2JexfkwHxyo?=
 =?us-ascii?Q?KHq28f/WG/wuukGPaFP4VKFMmITBPO+r+xCfalpXadQJPoU+rdwjF/DNJZO7?=
 =?us-ascii?Q?ZP0F1uF4jBZHuKIfLnjG35r9bk0UH/VRWJ6vyRSwVSzdFWP3cMJklTPzhisQ?=
 =?us-ascii?Q?cc/8KkC4Ij0klzFu5Wuhz4QgoKpUHELUp7lxo1GPe0IohulsQNc9+8vUcIcF?=
 =?us-ascii?Q?FtB6iDD5fPDkk5cNOkGoCulygQ27KPoj0IONcNPV+HHseT9ZmWx+r/wGbVLj?=
 =?us-ascii?Q?WKTlyv2JZT70pNExT2vPlUadhmH+txIJCz73ok+a8pRXB6hsYq1kNe3XnCOF?=
 =?us-ascii?Q?V7i9EMJ7tdmjhtAmhf43kH7op/WC9ZXdrpfM2W6ljWWf63djuljkcxY0QUSi?=
 =?us-ascii?Q?PzTmHJHxK+Hnq0FdGtKwdjMOfcc+CxN/9Oj0Yv+o2zKmjw+an0kH3Rbr24kc?=
 =?us-ascii?Q?Blo6GN1xoODjoDBBQHD25SnWz1TqpwF3UrLgy57Fw42Pv+8SPLCgccZ+onAA?=
 =?us-ascii?Q?Ba/9DfAToSMtIq38aNqmnocsRlWTm4HSCBovnEJ0WjuTigOCVezm2dmNiA66?=
 =?us-ascii?Q?uxzyVHKl16hEAgp8RNeAlyk6ANvIsBMJyomir2FLw2lh7dkFkYGKR0pvcIYh?=
 =?us-ascii?Q?4QK/q+7uqJipDcXjzuIsKoZ4CDT6DlYQM6yGIx50ASoiZ7LH95fE/sL+lKln?=
 =?us-ascii?Q?0ZZfjAWfB4daUx4GpjUVXx1WZ1i0SaU9DyGMpgC0kLZKZzuB7yaXpaW3h2gY?=
 =?us-ascii?Q?xVq266u6LKVvFwH9X3nO6FsTOEAALaNewEvwrR0MYv3pUWsQsftWPXkB/Vok?=
 =?us-ascii?Q?5+BLEez9NYOoWUrm2I6EinX9m1gX4M9LxQjgFO7mtBQPVPDIb/MfrTTw8GhG?=
 =?us-ascii?Q?47aqPBN91Nj9nrCHICqiTET1YFgGAX6P4R0mq8yEbBfgksn4sardKhaDEhfh?=
 =?us-ascii?Q?AfHHvtqVjITsnWIPtkxAbXJrYRLKaWuu+EJngrhNFSZEPJgwFxTwXAUYbnqi?=
 =?us-ascii?Q?TTe8tFzozg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9918a63d-3b8e-4a8f-0a9f-08defff05f2b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:54:59.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8b35v+YmklDTzT35PnbFoulLK9KNt2WV9Q6gq9bPQ6f3AG3dEKdDDlbsPuDgfT/MlQdB29YBJHHazvyHnqrfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The Rust PCI abstraction exposes a device's bus and device numbers
through dev_id(), which returns the packed PCI_DEVID value, but it does
not provide an accessor for the PCI domain number.

Add domain_nr(). Because pci_domain_nr() is a static inline rather than
an exported function, the accessor needs a helper as well.

The nova-core GPU driver needs the domain to build the domain/bus/device
word that GSP-RM firmware requires.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/helpers/pci.c |  5 +++++
 rust/kernel/pci.rs | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index a714cc2bfb7a..e11ddb4de54e 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -7,6 +7,11 @@ __rust_helper u16 rust_helper_pci_dev_id(struct pci_dev *dev)
 	return PCI_DEVID(dev->bus->number, dev->devfn);
 }
 
+__rust_helper int rust_helper_pci_domain_nr(struct pci_dev *dev)
+{
+	return pci_domain_nr(dev->bus);
+}
+
 __rust_helper resource_size_t
 rust_helper_pci_resource_start(struct pci_dev *pdev, int bar)
 {
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 287a4d259f13..c661829434a3 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -405,6 +405,18 @@ pub fn dev_id(&self) -> u16 {
         unsafe { bindings::pci_dev_id(self.as_raw()) }
     }
 
+    /// Returns the PCI domain number of the bus this device is on.
+    #[inline]
+    pub fn domain_nr(&self) -> u32 {
+        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
+        // `struct pci_dev`.
+        let domain_nr = unsafe { bindings::pci_domain_nr(self.as_raw()) };
+
+        // CAST: The C function returns `int`, but a PCI domain number is always
+        // non-negative, so this cast will not lose any information.
+        domain_nr as u32
+    }
+
     /// Returns the PCI subsystem vendor ID.
     #[inline]
     pub fn subsystem_vendor_id(&self) -> u16 {
-- 
2.55.0

