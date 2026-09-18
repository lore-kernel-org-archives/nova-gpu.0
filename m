Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD131AF14
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693652; cv=fail; b=NkNTNSEfwUZUYeSe+q59h1HnasXMd/zbkEh+yoQ9c3SVZ0qA9WlsjDlfHC0e4oCSh7BNq9nFVVZhljEHlBqY9pXDL4+0WaSnrEg4dGGeXJBaKn2e1ZUfBOylDusnhyagp+N4oa30NTbfL9LwUg+Q8x7CNVWMY/JajwfrCvDdU8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693652; c=relaxed/simple;
	bh=G929ViV+UKBlIC/4wVo4gO84q2s27fb6claKITA2gFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fp3JXIZg9c2JePRVL6bki8rDE0lXFWx+qF6b+WEL57gHWQq+6kl2vYYLxiKXFw6iCJyV19SbF1Z/DgNW6w+JXW4kux01UDqZ42hP6mAnlfhxP9IbBrWvWh8Gybxd9CwlYgSKZDoDKZgvz1pu5GEbzGedH44Jbdb2E/EMogCdD+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QtrgXwS4; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QtrgXwS4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLGmXQp4Le1+oxf3k34urBcn4Zt3UtReJP3eJGmNULHB3lVChQdVoQN9/Bxcz+q0P0g/PpobSu5m8bguitlTM+etPrM2s+hga7/BGbWWva0Tb1u9TTsQKV6iMQ7T7VopqK/DA/gX2eksLyToPGdUUoSy6vM6V6FA+QaTwv/j7As1ugpveJ99MReJBvcrpYqghW8WjAYohwIHv+eD5PLbd8EvU9vE4AfzAd4lu5cnTh1WSvfbK4oNHrAIYX3iTBNMvOvdIS7EFFQlGXMiyvopDY4XG2lgJ791RwggRGLnRgVYq+Kwxa+Y4ND2KFvUMue1ZgueD3ndR0nCrpBqkKRzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HluQ8Ikuk6TuJyMY5YvktaKuTLKY4YZc84lMzOa8rOg=;
 b=p92XKGcRNIxR+nLJ/ZhN33pQe2nPR92oTLnJjIYezUI1lT9c1Q91AoXC2qG999041yjdr4fie8oBIukZVV1aIfjq1u8/NkW4Pv7WS9kYOUaY86LhITCVQPwAZC/LKO2Bmh8lqCyqhxmq4TTm/4Zy2PO3RJK2htu3dASLzvM8GxIXHYMq7O54RkFgQF+RsRUcgD9QHsq6iSmeOX2vmoFs8I2QcPOl1UlIia2HKGGEOI57nTku889M/O0DiRg4/L/YGnN26dSNcYdjhC9d86oc88gIOR8hAuQu6Jqydp1tssHlVeSAB6pLzS+X+osMn+Q+/1tOUYABCWAWwDnCbXUFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HluQ8Ikuk6TuJyMY5YvktaKuTLKY4YZc84lMzOa8rOg=;
 b=QtrgXwS4wdDGYAGrqgi+BsFAJ5QjthVGVnLHaEfii5CwVRcAVPTZnhtuuwXLOB+5NyKpKsBHKcrO0leqg9vZl9C2Eiio5VZAYJGdTbbwQJke+eJI8nrnxCSSYAdQ/E8XkbHYbMU5LoeQ78f7fDnRLrkljw8MAYq25E+yjTebNKSEuj+Q2lrJB5fcnfqnpGFcwWskcva4pVMs6sEWCQ7rC+sjIPxkSs2uiNTXxRLTHQm3qxDcgQpGfN3uu+1bX25s+vAd1XYdy7CcZr5eWKdt+T7IcmiVe/yIifXfCSBo/hgArI2XHRZkVn6AMYXB7VaT+H1h5lXd2Cs0U/iNmo/Vfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:25 +0000
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
Subject: [PATCH v3 01/33] rust: pci: add domain_nr() accessor
Date: Thu, 17 Sep 2026 18:06:47 -0700
Message-ID: <20260918010719.1176945-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: e9702aba-da51-4634-876a-08df15213372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wAy6EOogXHaMII9/WrCMPFQDi9gp2sainwtBF8A2PQ2B+1MPV/C1L2IuycHGrK7TGZLrTR/6V3rM1XjVk0HV1HXamIQj3zKTaXNg7A3iLrlJHqQbgCBM4y5GSsj4pji+1qTpyKY6A2FcWA6ojfwnigXe8RHf621cZLWisqw+hqWQwGchrSqUxe2wEkTBU3eRsOzHHw2Tm07VplI/8x9bTnCOuWnGOClPIpYPBx2xmbPB/RhL+0LSCJExgGUZRSKyrw9IqEJFCaprhI8i8mHoJwXvAkGSFVMQa01MeLw4qm5/hMrRFlDuCH/sAU9UHFABZUnBpqMCBUhjxxUveYCq+oClbkmlJiaCsOa+Xup0PibpeZOo1GtnvoMAQgbNFy/rqX4hE/eZLfBbR0SJXQRth2wgLS0ORLCyyNT6y4yeJqM4n6enS4e6LI/XjNlV7QNJSaO3WxFScMoqibbME/GRllW0R0VxbCn2hsBXBmRt/3HNaCzG434fQP5kzcVb8+57L65Svj4KO9hMNXaCHi8Ej21p8qnzZmk6S+y5HOv/ZLByswQDH6zrkxAs6+80q1jP6jh+jhZtj9NWyTCVAwmM8xF8MZzvOlgIJZtiXGFnPdyPemOtaD/y2KgNM62I05kqDAJGaEQObsjiLXb3wJA5MKZG45eWkC8mqzcXc4IpKW0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DFqEbLlAuqWTHmW1Ddesc0R1nrKtMu6HZuBcNLd+iidLuRovJ8tn2FXk8PM8?=
 =?us-ascii?Q?ApjuLEDiLJqalWhR6VRlawdTsG9dZWt8QpH2AXcg+rHRPkdtGSyc6MjMxPUA?=
 =?us-ascii?Q?t9Dp0Mokp9RO5EbPWe6pHlIuZ17lkRn8KsijzYQFDrjw5mxxZrSShFLgCPel?=
 =?us-ascii?Q?YZs75c3tJToof7fkp429Tgzu9nImzg2zq1Uz59So9GsrtRog7kwD2LPdHU+O?=
 =?us-ascii?Q?7DsSQjdlu6km96AYMxr2UAhcrT26eHWkYQ6epX2Y82/VcKl8DpJlxwRwp+Ms?=
 =?us-ascii?Q?nBFBh9IhQAxVT3PCxn+l56IJ6tJITl4gKkAtTUYHMTF+bPGn3GETHFpnI0Ha?=
 =?us-ascii?Q?vh/4p7l9JhmUhS7RINRLbyn4X/FG94wzISQhVXdxJsjducBKQu0RmzGzigmx?=
 =?us-ascii?Q?6zS4F7zHXy8hB3QN6rnYzFgjy+msWsaw0SbJm0Ad6uPKw9/6VoDXLuz5VaXL?=
 =?us-ascii?Q?+owaZkpaS22BMG4g4MkaxPgdOOFj60BhUUpPwiADeGK+rOd8snb3BawgSBAv?=
 =?us-ascii?Q?4py6NkxlJxKfpEbEAf27iiqZaYdoHb3QAEU9WlsXsEKnKTne0QidKjvYw53N?=
 =?us-ascii?Q?qu9lUjtkD+HXhcwvDNP77TVELkagc7YLHvJLrO+X6ANtkQXUidviWY+3Jpf3?=
 =?us-ascii?Q?g7EcMW9KXfAUz40ERAU2Vo7Uz/ShOUmQiFh0INuCtnyxmHCl7YropxjOlJjv?=
 =?us-ascii?Q?asOC/dbh4QWcvd9Kc60kG9dgP0YLHma+Whut9e9Zxv6fGH5yG3yAB/hk7TNU?=
 =?us-ascii?Q?l1egyxEE6kE3ZTuu3PR4TZ2fx+CBEnGroQLPWMqVjOpJ9Rcg16L9S3/TgbOa?=
 =?us-ascii?Q?ryYaWSiH2/zSrK7wVe+BTaiOsQSz99m7jpTAsq4fMlw2/7CKJH5FnnDSdudS?=
 =?us-ascii?Q?PyZnxetddtdRT2oAA78w5frtJUQzrdYCklK7iHCN67eefL4TTP2Fgri9nizK?=
 =?us-ascii?Q?jL8SDFCJbW7gUkQx1sp2FTV6I1afzbglqHYfV3U4bccyNIBPcZabtvzBfQtW?=
 =?us-ascii?Q?ep0wNdd8oPfWH2ucfrP6RejSwcbEEeR1JGrYVg9ziOp6CGUoKFSnftcXA5JF?=
 =?us-ascii?Q?ogQl8ggLjykW5uR4ip44pQtmJS65OF3SX7+UQdg6QtWI0Pd3IXAMLMoj4cXo?=
 =?us-ascii?Q?btbEWo5++8Aw2xYxtXasLIKWaKuREKix7/EtASCg/yfEPvayB+wl747az5tM?=
 =?us-ascii?Q?tQj4pkRG2gVAu8Q5V5cGAEJagjFgYKKUQBzmU8iZZeJbBK6Ax1hQ3efXDJDs?=
 =?us-ascii?Q?NYlV8+6NTGL0IGTNFL6OQl5Bfkz9qVP+AwGgjGgLqX8/r9NT4Tmvmeve/JSn?=
 =?us-ascii?Q?Pzr6M5gBHNhWme54D3MsRTI/MTOxQYGV4TKi8p2BHlHpkI0hPqzj/GAaD7JV?=
 =?us-ascii?Q?3ZrzH+ijo0d5aqq3GtcXax0mRf9so8PetqRitT67crBXbE16lPsddLmmJahW?=
 =?us-ascii?Q?waGgPI7cwJVglV5zSNDQr33+OaDph7yB9lSQ1AUCW2XTWnWLpGfkR5MIxhtg?=
 =?us-ascii?Q?K47SZ1oXmW7QAWG0DmJ4ettvrPs/arjFmTf3t3vx+R75uXfTeaGSNXXIEMNV?=
 =?us-ascii?Q?j6VJPnHlU9VkANvj1iNnkgD9OkJ6t4MWZ4nX7qqRJqgp6oLnwxSktSr11lmM?=
 =?us-ascii?Q?xQnfHJDroL4treDGm+DN+9VW3NSCb7GYOTNT/fp3of+MGMCz2Sw5IOJ8Q9NP?=
 =?us-ascii?Q?QFCvOpJn1eIzwji6StedA1bGZblMSjeFhVsGjIV86UHHUSxN/jAvboVGqls6?=
 =?us-ascii?Q?xZLQ3YpD4w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9702aba-da51-4634-876a-08df15213372
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:25.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB2eYXs3IPj5g+02p9UJ7j0cphv+cwoIrwbop6jjvPdkdRUB4fXYFZ05qCWePp3wFNHMEf841241Ze2q2q3JXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The nova-core driver has to send the GPU's PCI location to the GPU's
firmware as one word that holds the domain, the bus and the device
number.

The PCI abstraction has dev_id(), which packs the bus, the device and
the function into one value. It has no accessor that reports the domain.

Add an accessor for the domain number. pci_domain_nr() is a static
inline, so it needs a C helper. The bus of a bound device always has a
domain assigned, so a negative value would be a kernel bug rather than a
condition to report. A debug assertion checks for it before the cast to
u32, and the accessor returns no error.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/helpers/pci.c |  5 +++++
 rust/kernel/pci.rs | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index 3686e405160d..53cdc7f36fef 100644
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
index 19a219847c17..8d379a2d7c71 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -400,6 +400,18 @@ pub fn dev_id(&self) -> u16 {
         unsafe { bindings::pci_dev_id(self.as_raw()) }
     }
 
+    /// Returns the PCI domain number of the bus that this device is on.
+    #[inline]
+    pub fn domain_nr(&self) -> u32 {
+        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
+        // `struct pci_dev`.
+        let domain_nr = unsafe { bindings::pci_domain_nr(self.as_raw()) };
+        debug_assert!(domain_nr >= 0);
+
+        // CAST: `pci_domain_nr` returns a non-negative domain number in an `int`.
+        domain_nr as u32
+    }
+
     /// Returns the PCI subsystem vendor ID.
     #[inline]
     pub fn subsystem_vendor_id(&self) -> u16 {
-- 
2.55.0

