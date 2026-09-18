Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EFB3B9D93
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 02:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697593; cv=fail; b=pcjzs1jDadJhHp+WqxXp9xkkGb+gEdUDuVuadbUynqxE4VSyDYRMT6a/mrtbCTmZoyg5fC3mHDMPH8E9A3oIZ4YkgvgiuXQN20cxskDG4cu1VtsjdQRi8bJJNc6K9cgta3TuwkUb70dJJWNLFmyaVYhQX5VLLJOiMqmpoYe8vhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697593; c=relaxed/simple;
	bh=43JYzRHwzsqmsIFH4VKW3q7JRxFNnyNNbaQU0ZRPbpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I4F7KU/SM8UyxmCaJTPY/CAEp1oiMBTg+kd9obfGq2dx9NonHwZ6j5sUq3PQzCQZ8+z+yWaVWJXZNMJKm7MgchGoHfIavWOUv6MLA7srq2SEP9GHuVoDp6CoERQvTtDB62ejRJ2vFsXI9U38+EmaBDuKbR3Isdkb/JRbmLLpI+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jVuoIbUk; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jVuoIbUk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igto7KauOibnTjsEaHrwRgXVH+D0zpue4DGjDqylD2T8YcJe2ceYZ/c36eDfZ2pDyIrwY0pCPPA06Kt7YJzFKZWLUtsSDOC/8mA//G3QyO9f8CvkjlTBWQCSz/w+LL/GDj4ACK85zz+2usf3e/x1yjeOf0JLs9tvZa5qW+D3/+DOM5sL7/Inb7fjJTpOQp1McwP7sw4r3L1eyuyMS55gu77YkQYSlh1vGLudQrpXr5Hab6uLTL/Kh2yoWeAV4cCBsdMnJsscjC7tk6FwLkSiD5rMamFyLSnXJMEpjXBH3ZmO2FZb3VKrx4emEPhdMqI7mJXb8OlH9Ssj5W87dF4rhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpTdP7WLa1ye0z+lGpvFlMDKLTKOa3TSOmAT8fvTO9A=;
 b=EJoJiO7vjAXg0LzcJY1OaSmOEJAYaxXQjZKTaKCiF0eONXrijAe9I2MZvuo+KuXsc51PtLOMtb2MNWe4ezPXy/o1AFaV5RpbEQwFediXcLieOrmGupO78HZv25aboEiCrRUN6aXZwPJJOkuYhcyiFZHenBPLx5v5z68dl4d7Vz4qzAPoChChYCkcykk9uDt1Ejd1TsXg/rTZYRBlnN2zvKtIKwWwC+kCoZyJVzj3vJK0oYviLLIOz56u0TC9RCxmBogBoEzvgPLmD47BEBijD99i9kUw6AM6+cGB7pYD4X5QXWO7qFUzXm5E8xVtOW9ANWZphNlnDohHY28kYoq2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpTdP7WLa1ye0z+lGpvFlMDKLTKOa3TSOmAT8fvTO9A=;
 b=jVuoIbUkihTAdTjOb/d1sH1WcnRVNEBPFT4POnwrc9jgaoqwz+AkDYiP11laZzhjIKf/U3BfFWHe1QfQzGP4yA65RAwI5pgT5ktQQHMTTIzALhhXtkAZwyb9R+pHC1puAIWHRNRlmpHXnnSdIxvv1WtiPblat+v1zZRwgUyjJIJwGGs34HUijpIZRcQDxgI/d4i99PlwKV72OclVPH64SIT2UTgEmseqja8yyN9ZxL2kU9Y00LaYHvG2yS+tN24F2Otx63NEmzDdcsSvwbp/kBLi67Za4lDbtd37lCLVwYWW7QdCUyBSax+2wKCLzhp1xZYdAzBW2BjcdPtNWU1/Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.12; Fri, 18 Sep 2026 02:13:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:13:04 +0000
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
Subject: [PATCH 1/4] gpu: nova-core: record the BOOT_42 implementation field in the GPU spec
Date: Thu, 17 Sep 2026 19:12:46 -0700
Message-ID: <20260918021249.1187837-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918021249.1187837-1-jhubbard@nvidia.com>
References: <20260918021249.1187837-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:510:4::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8f5c14-decb-4b0c-cdce-08df152a5ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FMnfjKR9roMIhZgG4GcyoR0n9PgN9dPBhFuoqD9RrrmfrAWxsoUydJnQFsH4boJKKy83+eCzwCv0mZPiPXUi9b7euz3jqTaJdPxD5Xfw8O9upmxrOaHAY8ZCEgML74CHiULSsOWR9nqFCmiciscYhUpT0/FPQfx8u22fNPty+ui6ktF3ycU2v180BouiyVAlOP2XLvv7Qt8yQKaFJE+VAhTv1Q62r1EtAyny9wQD07BPr8mFl3R2MfRWhKrHwTJ/O2DNRONcw3szsgO0otkOKpmpudZb/zjMZJ9WpLiGuUg10Me1nzdCpZJ9dS4KnCweKL4kf+hCdQgOc+DX6opAB5DMxukQHDbRUXZeOXpqiVSJLwefk+uNmapTVWD6/7XVzMZLqij8v0EMiqR5qzesHe86w8UY8THwKxVwzhjUYOSva47G3IieSrMr9gYM4SgbkPuvKeO/vpASjXqs4v2rVmajP39XoFQUXTvEGe3t3C0lzDnb1o1ojbTR1O3Wy8NWYBjMMtyTR9gAV+17NdIGy5srJpU68Vf30sp+I17X9Ztq/Boo7QcKEkhBbcCRyocCiLueXvF+7/R+swQZa0CFYqTJ2EqiwfajKlVVuc42UPrCWT3ljXZqNbtUa3rgq6R9ZXAQ9AyMHeWi/H189dkW6mz4IJNIQQnTDSdqSxxBMlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6iFjon54Ov0N/VgfZfkSK0oZEUjPwWH21lE9tRcpp/RcFnofZmV2U6SiukTe?=
 =?us-ascii?Q?dLGdi/tJICjM9ppXo9SuV7L8UeL2bVnEU7l2Mskoi4/sIeJqJ/kLBWv076KB?=
 =?us-ascii?Q?7RiQOst7QexJRqQ1/uUAViTU6PVOx4FJuFYn46wj68IvTlvRJdmDE+vL11It?=
 =?us-ascii?Q?8zdBKElq6yXgzbMjmKNMPWakqYbeOakVuLlbhfXDJSdhca6qHqmAz9aCc5Rc?=
 =?us-ascii?Q?RtAxje8UfgVKK092sflZUvSGhZXHHi8Uivnf2fLWuo+9lFbLmeichZxd2PJU?=
 =?us-ascii?Q?vWaGPPwyohpjoWKQGHHcFJ9g3a+WEF4xMLDa7+5I5mZsK9STkhSICLfm1Ko6?=
 =?us-ascii?Q?9EiHw/FePEge/BSwcm27QuRzGOVvM/+LtJBHKivaveM1D8rhtypy5jrTSxkh?=
 =?us-ascii?Q?pASeEYw/vo3IokcRL76p/iI1ZgfDM2M+rrqFSw/XseBNjxwYp++m1Y63rRTC?=
 =?us-ascii?Q?hvzPVtuvnB+3/lCaomeMdp5nUVlXXVk6YAzlaAVgWSzOLfYbIAstvRQChNFC?=
 =?us-ascii?Q?KyRBh9H3JhCINXuP+DCWhpNeNvJT5SE1kqhkiE4ZlLPD9cwXCvRiDL4svYjY?=
 =?us-ascii?Q?fzhF2Ts4q/Wv8Y6dlDSGRa/3vsMXrMvHe+vu0NoLCCLEjxnKySbj5CQb0OIa?=
 =?us-ascii?Q?MFdrJRYWqEUFQ3Bx/TyGuhvoeBEX/9Y8RmzCLBOTpj86q556qBbQbT4riTH8?=
 =?us-ascii?Q?JB4sLTfzNeJNuHf13gSEoNP9XJ11FmY/F26h83xrRNTcQ7E1J6tkg7UrScy3?=
 =?us-ascii?Q?2sCGhLbh3SPymCv49AdpDvbSwyVCruhaYe3ejU39+01IeTclKFy6YTiUJtLC?=
 =?us-ascii?Q?zkeBBkH/eZnNv0M5/ZCNmKe+3egGtKU2vFg/9ZUjjxrvMEOX4HtS6jWPhoUv?=
 =?us-ascii?Q?9ZmRVLHjot3rCqMcfOYR8ArPWX4SaXe4BjgjZgifK64efekhrSkhCh/B879h?=
 =?us-ascii?Q?X75WF/FoThxhtTxt76hPA4ouxD+WOFplhxs8/TnBmBwinlwCeY66guQHOjd8?=
 =?us-ascii?Q?CxKGCcC6HmATBPxnp361iXmFNeucbxYMLW9b1Xke488/HToribkbHGXvCWvg?=
 =?us-ascii?Q?Bace/CZyOJ+01TV2lXm7v9a1vId6jzzsRuaR89PVReZZfmf5H4sgrn26+RtU?=
 =?us-ascii?Q?n18K7tJBOZHwEe7217herLD6KqeD4IJuExnklJFdBaBhpHH5/etm0YOqG5VI?=
 =?us-ascii?Q?5DVFr/wCIn5e+uEOCYpQ+EMqJt4w5RKoedS/dQWEW5kXFqqEt4GvnGejzulD?=
 =?us-ascii?Q?2JUmaMjzOXn5e8f9jFVvlg/whls3Qkz2t148HyGf2kYbaFIGFHKtA8PrrWNa?=
 =?us-ascii?Q?9fZDiA/4GaNrv0sbd71dJslO1n1zY/ZWbWdezaZoUUlOYZWOabeaqqIO7N0w?=
 =?us-ascii?Q?PIU3Jstl+4VnKr5OEFPKOjYDgib6TOrVNA8SYzbODtIWWJAJS2XRK68OoyNh?=
 =?us-ascii?Q?Buy7M4ml+rxSE3ow1af4w+dtnE6MqNm7FTyn9nrlCMknR2ifTT8l5kpj5nWW?=
 =?us-ascii?Q?IPBeCqWsxN+gozQXhEeY2HUNsa+1zg+8May5+D5SLE1X9YyH42pY0zr0x9D4?=
 =?us-ascii?Q?unDZeEsGQSCWIpW3sArJukE5dvZOe2kjr3UKBqIMnZ146Z1N+vD7hLzb6ud/?=
 =?us-ascii?Q?C3UB9iv86upeqSjbAr8DMWiMdUbQqJSUYwJN41+hLk0a32CmTyz/JylR3Fww?=
 =?us-ascii?Q?bRcXlH3zgwhWPDPxIhi8m0DQn5kVUHeNO2wFnn3iw65RuMOtDs8WoO+H0CXP?=
 =?us-ascii?Q?3/dh4DkC+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8f5c14-decb-4b0c-cdce-08df152a5ed7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:13:03.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meZGgmjtjv0CaQlsPL81p0/YI3g3bCJ4SBrY3MPNqh/JqBHvgwyMC6MOSWEPzQje2kiQy0PB8TS1HdURWhAfSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015

NV_PMC_BOOT_42, the register that identifies the GPU, carries an
architecture field and an implementation field. Open RM keeps the two
fields as it reads them, and the GSP log headers that Open RM writes
name the GPU by both.

Nova-core combined the two fields into one chipset code at probe and
kept only that code, so the implementation number could be recovered
only by undoing the combination.

Record the implementation field in the GPU spec beside the chipset
code.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fd1a74913d7c..cecd8e79430d 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -213,10 +213,15 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-/// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
+/// Structure holding a basic description of the GPU: `Chipset`, the implementation field of
+/// `NV_PMC_BOOT_42`, and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
     pub(crate) chipset: Chipset,
+    /// Implementation field of `NV_PMC_BOOT_42`, which distinguishes this chipset from the other
+    /// chipsets of its architecture.
+    #[expect(dead_code)]
+    pub(crate) implementation: u8,
     revision: Revision,
 }
 
@@ -259,6 +264,7 @@ impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
     fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
         Ok(Self {
             chipset: boot42.chipset()?,
+            implementation: boot42.implementation().into(),
             revision: boot42.into(),
         })
     }
-- 
2.55.0

