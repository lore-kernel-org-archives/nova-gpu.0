Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E370836
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370510; cv=fail; b=MAjuwxuvjLk8jhKPmt/UN+UpQSEJJG6rhptsZUnwfrNYGVd25s/Dq3PW7uXTQTl3gLkTTGVIPNOeFo5XMUwRTMqHJA5KSvDb3fhcP3/16VV7C8DNycEiaLpXPDKnwUpBVyZvDKqbg75ZeTGbxHj+QEpVxuKBeSYb9ZCiokNBEeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370510; c=relaxed/simple;
	bh=8K86V/MhZvc2tN0uZbh0z7ElLKjJGb0DLpaCB4eIvY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YFuZZz/L7WyBSSBBLXuSHzOc3d1nCNUTELwkzUYZH1bbW5g6ThSkoYyIsoDMdNP5YPHwKmmdvzoLiGA7Qzb+gffYKYCY8ImcxpBLyH6J6tWx2Yr9UwyX8qwyurs5rP9yHuQD/mQ6kzEKog09FsgsuJPDdsEkZwRrBlsvP77tkFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=atln/43u; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="atln/43u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgEMKZ7xQYnnE97KJIfDP86QgNJvnw4fBTFqX+UMDh1d79IC7wh1/EHrllC04Mt4trNMVOBppkMNLHbb4a7OxZy5VzogYCyUMWTbp38Pg4MSFanAQslwOJP9b6phqnYisByokcQtVnZ0h23ekRtO02NvXhKPjY7NZtWiM9H11dIcOlImBUQd774E9IAKsxA4eTkp7PZLPVX3URxJtpY25mKT6Hkej4WmFLxVZcLU6xjP4QsyMKd6b76fie8Cb5N01RWJLS6tTbnE0sGpK3TOWR94PWtH640FglPblNp1OJx0H4XdX6mNM4m9QP2lCL40pqSGvKs/XFGQDI1ejdTsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F9mnOd8UcjnlKaV3NKHJ7ZyJAZg8kfRPUtmRbE7uGE=;
 b=hDFEWEKEwv0E6AAcAK7ybt32SHIhY+lQJwfyjKQ6J49uMvguR2GtRwL9dhR8INwv2YSx13gCiorg5x5pjjP73VGH4P9/43QLdt+COpP3y6vS0T9lM1ppjNCfelhNbwTk2SuDWdJtkIbtMRPqTrUSb5tOMqlUSvcPdyYYzVr7Vj91fZip5aon4Y09IZHyfQc3Eol8rtiatwt8SjCcvXYekhzqljCtSbtZwI9YUy9K/4YPuO4c+vgHamiNK+Mg+dD8E1G+b6OezzlfLZMfdHYIQRJpcDT+VSU0YXqeJAA55OA39nd0cqity9dyqLBpDTvZwK0W/HNc3oO7rW5L8dL8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F9mnOd8UcjnlKaV3NKHJ7ZyJAZg8kfRPUtmRbE7uGE=;
 b=atln/43uerSwtfJ8/8JSxviYz25euTFVVy3hZltjUTZmWLbrItpGFVCjKUxFnFJUiyBOrw2mX35eEznNtdM8y/hxL6WRQFcxoXl3HhdWH5dyvYtHcWlY8EvyQK0/PjHnG64ipPC2JRljbAJkCtlFjtFZPADZ6HQOCyloJ2LPJXXNCENU30iiiwphfYotUBTtFa1JGbi6lb4Rd3bGqwb4x71CYXghDwWd+0/EwGSd3AHniw4lKx2u2k7Q80Dl1QZYkrUXpAwrn15nAOtGYgZK8YqCmGbj8G1SudjqWA+KCZCuD8/I3VgDXMjWYdlOc+E1AswEWtgi+L92PgwUlqh6Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:25 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
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
Subject: [PATCH v12 09/22] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Mon,  1 Jun 2026 20:20:57 -0700
Message-ID: <20260602032111.224790-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: d715a856-dd57-4f64-468e-08dec05606f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	QIE3ODz3g658FPyvgHvjgVAtYM3+K8KOd4uiK1IJMIUh4mvUitUFZPutyGT/kOl6g95xqioLf2/KrauOkue1bD7t6nASe/jxmwdNYs5oSrZ0fNLI9SRS/UnVBZQraQujtseTWWyPcOTNOrTBHA+48bCoo/egv3j/zA3YUZBu36eARVWzHPMib9K3GdOPAEvMEUsZtSBOfHAeKATQcp1N3QahIPVDrsHhQA+peo+XuR0T/cnkcLkMLCvX+CFX29Z2wfEfk/tvQO3bY66hk1QkGAbK7lzwZhcSsQaYftkBtCNX9e8qed9uzk/xcHMDfqmKX6SmsGhLidTVUBG+oPJq9tPjqY/xJUGp3pTnBj4kEC1iJI/SGgIkUKdm2sHYO7oJX+lJpEi4dEf3wDAzK9WUau4Y+AYIXzwOyziYWy4FGtjDaakOfq4X0FjRr3lv/jR1YBwIAr6t6K9i4e1N7hlS0MM8vNdPF3KfLlC5w0Lv5pKdAo5m5Pp3PwwdlwpV2k9Gr+/S1Gz8oGl7/oTuBjx7gdjEiULag6ua3bojCb+V81YSbSqNmVDSn2d9SwKUvYFA5Nnvyb66P2KL0WAD2pNXpCCLDUrROqAFt92viy7ltWxHomPu1hZtp13opnvV8ffWqfehHWly7A/zgrNdNZC0hGxm3eTPMlRPTb1SQOJqz0kYVrdagBNBqp9QApRXaJQd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YyS9bL+9qP29RxdEobizv8YKejDIEI/C5NWjmvriFW88D6+FCXjV3wPSjIoy?=
 =?us-ascii?Q?K9l37LCPph+25FToAPuMMSa0nway8hdBD4jjxYgqB7zLDuwWPUhyPYadRVG7?=
 =?us-ascii?Q?eLEaEQSI7cPcjR0CitXdy7vnd3jT7n87o6lLRdhPKmgnBulmB+qy9jtvn5oU?=
 =?us-ascii?Q?67ZtZL7E1TSxCAhSWRkP2lwc22PBg3ID02/x3qRj1YM5Lhpt6araM389c0P+?=
 =?us-ascii?Q?pZN8raN17X8y8nR3hk2scngUzlT6IqR45Xu8C9BP2RWT4dQJAcOXzo5KrpKH?=
 =?us-ascii?Q?QWiquEAh8+6Ezbz68EeQKVjH/XsxxmN15M/CFPxFU+89l3d2oHPqm8NvfGIy?=
 =?us-ascii?Q?14YAgsVMMWnH4kFSN2tWezqWfb2Ac1HEHnd1uunF5hNvdNG14+hBGd8Ql/MI?=
 =?us-ascii?Q?PFImPZYBccTXeftNw/rlg9u365egxO32mB2/pm9PazlvrEfmamD0lJh6MbkC?=
 =?us-ascii?Q?/rd5hFY2phLUl+qr6WQbTari32cDa5TQYG+pi4nE/CAg0/3eE1kxweH/BNPz?=
 =?us-ascii?Q?WdnLOzSixJe8TFmhCRz1YE2mnfDBIanO8CJ8ouYgq8KFtd5dkSPHemlblpHt?=
 =?us-ascii?Q?m4/Kn/8NC14coD7MTKP2sgLO5abYhygS0+kwMrwcM+gz2xmdfgsfo/nY/w6K?=
 =?us-ascii?Q?M2ho8EveCyxxPRhbUbZe9NOdZ7wrEev6no3/+iWSqK1LQHn+SBCOpVZ7tUAJ?=
 =?us-ascii?Q?HonUMT2DTmY+YtQeUzsvkd8k9s6XM4efdFa0Bj7ON46zxYJBB+4BkbxTqh0b?=
 =?us-ascii?Q?XKDwsxDHqBhLz1EJlKdOj19Fm78jTsfekMg5q4IrgJWze1/O1T8bWwmWvmOF?=
 =?us-ascii?Q?39Rd0SoNRJG79L5hJ0ojYQMLdmKlgE/JD/9mzMF3QLNB0FImxNVcDRanoLtt?=
 =?us-ascii?Q?WOe/LY8bzDhn2/Yyukwum7rPe8vcrf/8QeXzGJiKiX1UsoobhOkfaqnU3RGZ?=
 =?us-ascii?Q?f0IZFrWQS5RoYPMpHEeg3MLBAZ6L6RqMjrSkyfmTjJH9lD45qa5WQAHQYXT/?=
 =?us-ascii?Q?It+hxLojg0rcRTp7swoCcTRR1efqf8DkbaJSyOEZzQlSUx/inQp+dtSkp63N?=
 =?us-ascii?Q?K9YvVPtKApZbfql50EnHVQAXiNZ0MGw9kBjwMWJKnK1Ka1AGBoYvLtOeZzD1?=
 =?us-ascii?Q?At7UQCIGOnLqP8x50umDvBTKzCWcUyezPHFka0L0P4xtbR0ObIcNtKgj6TkE?=
 =?us-ascii?Q?+4XbUqS0AeUS/HgNcVyJ24+yEFSPUZLDHgbNw9i1jfdnxKJY16tq++4VpVta?=
 =?us-ascii?Q?ys6WsmtzEFIUnCfXuwvm9GY3pReVumDztQ3wdiBUFinj0Jc+EY8lMO6aRDlH?=
 =?us-ascii?Q?jAjq2hopEMtf7PwyWbrLn/jC7MG/qD8BGMMsJNmWRWD5CI9YOUkM6IAtm+Tp?=
 =?us-ascii?Q?v+JGeBHrBoRLt57+mIUh7yfEry2uWkVrMH4s1gEAiLAzzchRsl/43vcV6Y+N?=
 =?us-ascii?Q?GTixW8upEE0sGxXIBLkQkvMOxpLYLzGSG8srhz4G9IzbZyE3KmuZQTF1noeM?=
 =?us-ascii?Q?nv+2/jnwbN4M2xMwRiCLkUi/Je+HIvsXGcKyShaL3YPBLr5DnCJTgk+4U0dp?=
 =?us-ascii?Q?ObCp4MjIKa57uTc/WgMdWIcBOTm6iw+qRNgc/D+R/7iUBHdRafnrjhrnz4z5?=
 =?us-ascii?Q?4191sbbpB3yYplyjbA1Ow1eqIkXLS0E9KpSAl/5MMR55eTbra3PJoBjuy74z?=
 =?us-ascii?Q?ZodZ23Yt7e5gOW4EaXgz5FHBrUb/N/v6INHOpYvI90XKmPKj1JEug00JYkTy?=
 =?us-ascii?Q?CNHZiTB2CQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d715a856-dd57-4f64-468e-08dec05606f0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:25.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XIoMjdqyC0LfpEMfujKUKZn/2rQubrzpN7+HO+fHt7/AONSjoloTqc6UrUKlAZ+GoMQMHzzpzNUO5DA8ZFF+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

A firmware image may be either a 32-bit or a 64-bit ELF, and callers
should not have to know which. Detect the ELF class from the image
header at parse time and dispatch to the matching parser, so a single
entry point handles both layouts.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 27 +++++++++++++++++++++++----
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e4dcc9a87b7e..87588cb24f11 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -629,14 +629,33 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
         })
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
 
     /// Extract the section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Format>(elf, name)
     }
+
+    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
+    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        // ELF identification: a 4-byte magic followed by a class byte (32- vs 64-bit).
+        const ELFMAG: &[u8] = b"\x7fELF";
+        const SELFMAG: usize = ELFMAG.len();
+        const EI_CLASS: usize = 4;
+        const ELFCLASS32: u8 = 1;
+        const ELFCLASS64: u8 = 2;
+
+        if elf.get(0..SELFMAG) != Some(ELFMAG) {
+            return None;
+        }
+
+        match *elf.get(EI_CLASS)? {
+            ELFCLASS32 => elf32_section(elf, name),
+            ELFCLASS64 => elf64_section(elf, name),
+            _ => None,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e576bc8a9b1c..99a302bae567 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -88,7 +88,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -148,7 +148,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset);
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| Coherent::from_slice(dev, data, GFP_KERNEL))?
                 },
-- 
2.54.0

