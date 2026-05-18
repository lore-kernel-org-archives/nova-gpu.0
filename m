Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7D39099C
	for <nova-gpu@lists.linux.dev>; Mon, 18 May 2026 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127440; cv=fail; b=ax04kLJxBahr4c+pGM8qBRYlPtI76OJchXazYDFa6v4dII2CysJ/agqx9funtP02jcoLHmcVVDeBWS17q8BmwQVMPfy+3yCnT38kglK1wGcbw54IJN1R6hFJTT931i5AvmR36pa8dNPLRpeJqLZL9wtE7HHZekGhuMIpEPwEPbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127440; c=relaxed/simple;
	bh=bvZfNxojaQT5X+xWxa2oAjzz89wGo6fCDvM7e2E+FPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dEPSIGqp6nfHHCWFTCCHyVd61Ip9in25/sCrk0ANQO08trW2tY75A+0sdo8EZIpLDK2arrs9JbvuEGFfsoRIl8sg6gkUYxF87tLb8bASAeNEdGt8UJ464VmsHwIgnL96IXK4/llVt54KIJJ7oMXJGKqjt20D/IMF44ik/lqedoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BC70FGAX; arc=fail smtp.client-ip=40.107.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BC70FGAX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jB+ebVkikUDn4R7NjhsmEBXR2MkTEFIuITxV/csL5qkKgy684wqaD7HeG/vGFBVJy2+67/5xSoCYLi3iDnhgPw/AezQi6OBvrGuxxr/yD7JyoN8gAcK2EenQAZfYMhSV3AHOUM4Z6pgGYVDh2V2yGBAt1SWFpLJtExs8OhxxMQZefnKRR4z/gd/nu5Hj2tybFShhWQHYd8okdalQondcNx3d/ei4938BrA2dzbZ493Fz8rw1mIWBl2eqQlx1CX+sNTfxQkvr7x9hwsDQcWSnkdu4CB3rUJJ3HXByT3NRMSrrwvPHTQiR8dGCwQ6bNr4HT8XhYVYXNn973OzBt8y28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0aqxY6b0VLqmL4sURQoxNzALyk36l15VoQ43Et33DY=;
 b=MMm5oE998iVHGLcarJHeUJlfoDJkPqbenIxJUFTFQRdYoRRkN6bMCTQ68Dv16JX1kZBlWG7AEVFmIuEhw935A0znzBPbfMqMTgr/dH4dzOunICjaaVimLqDiRdb7sCJ34EIBNCQODKsGIGS0tYnmEFN0HPYUpLC5en7hyE5aKQG5SvhOT72TD5gimJSMrXyuCUhmcrYaPaz9dHjuoZGg13oDsGO0WW2cezZDymLwOrbzygD++2f5yYUYZDYsBmpr7JxLExkgarrup1cMY8WC1Okpx/2qsqFF79xuX9+oR9VwHvGFvvEQiCqjwnSzHKk0RGDIHh1w2bY/b3R7EuEEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0aqxY6b0VLqmL4sURQoxNzALyk36l15VoQ43Et33DY=;
 b=BC70FGAXpo78Etsot8w14E3IKXWLigad8ilJlLZZOyllS8GxZCZ+W1WV8ih5i6mr7TwO7FtCuSQWeMtJ+dcbYVa60zwTlDzaDuzXt2KCNO2//Yq0QUgzfxtbBJ6H3hY98fPaVbic6fcHJ494B+bsCqoCZE1fCkJ8/h2nn9/elN/b/WY0xdL0YyUOd5oQ+Xa3Uzy6Bv5qwLa4slqkP6YHI1ewfdxfjqDMZI4d5/0noUlzayEDfkigjzGsdFt7nYzMf/lZVpxD5nrtErLckhSef52TJRPz4IbPI/8La0lsQ8YU2nk9fw6dD8d2sb4m8fiv/HqUl29hV79yumoSD38U8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB8114.namprd12.prod.outlook.com (2603:10b6:a03:4e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 18:03:50 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 18:03:50 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	Nikola Djukic <ndjukic@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andrea Righi <arighi@nvidia.com>,
	Andy Ritger <aritger@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>,
	alexeyi@nvidia.com,
	Eliot Courtney <ecourtney@nvidia.com>,
	joel@joelfernandes.org,
	linux-doc@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 03/12] gpu: nova-core: gsp: Return GspStaticInfo from boot()
Date: Mon, 18 May 2026 14:03:33 -0400
Message-Id: <20260518180342.2387845-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518180342.2387845-1-joelagnelf@nvidia.com>
References: <20260518180342.2387845-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:52f::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: ce96e6c3-6bf7-40df-4c6c-08deb507d090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	XoAQKwajGqPxeWjg9tsKi5OgXIksKiBd05f1STXTyyywBXP2/Hsrj1JjaIhHrxYnkwxsLUeit+y0vcNOczkuBmyCv4Epzy7a9agweZ52IYKiyzdwvdocg0XKLcnIHl/MLUwaRKy3VBJFWETqNxVcC+wp1jPRIY0Ubvk1lJAs2qr3e/5+S1u83GWvw1D4w+Scucc3y5gqowALgFcGU9zFaRFLChzSFGtC+UBtDQ5hs6f3+qti2c3GFEghtcloYauC1Va0Pbg6C+KLERCc3NSrm2Kwp6OlTryrDQduxSmOCgOQprZi6504jbi+Oub6ktZ5nqcB9m0o5OLTIVxAdiZpTdSWN7QV5Iez/+SO9irpSzzsOFDIu8BXch6r6UyCoYpvWK25PW8f9YV9v4IUeEE8+noOCN7hr/+WZb6L7mSq9uhluUp3Qnrnk2hcnoBHdc+5suxf8P+SmT5QDZH9YrHAuDVBr3DXkTuzZNBqkgVGCP/KnxWO1LBKX+gRYisABvKrmwhGJZQn7QoCrrvnyr8CvMoO8Z8loS+oOdD0DtABraMNnyeBnoHxJCPAMAn7/6krQ5sQz2ax7qQ+hgcwhJq8CtaEiQ5IA+KAVJQYpWg/jlyCv3Ryue5rPmSTOsogLVdD57wXSVJv19WXzA9JKtwsFIshTLhV2A27yaB+mIwAzoQ+62FQHfjPsp7cwuPr09l3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JQsIRm4FGD9wW6PkrhFak5z0yqY+oYLgJwWa1eOTxbtuIeu1XZguRt0X5rbN?=
 =?us-ascii?Q?yPCCi1OssOmoz20Ye0qnqZUG9GA9WB3RX06Tk6XT85gYX3WsiW4HkEO0oHeK?=
 =?us-ascii?Q?ITOPSI+ybxY3qHUzq6gVo37/RI08PFn1XFHltTbqEHdsr+AIcYsY3OEGnoio?=
 =?us-ascii?Q?oD3E78emfEdKcwFo0r57yi1DCHwD2h0JMwCMLouiHb27Z4yN8+uU1klipH3h?=
 =?us-ascii?Q?Jsho5cWuNuK0W4HTWXjcxq7Pl5LmDPW5/9f7VGYAAOxI8HuHWNZCaq4cHhif?=
 =?us-ascii?Q?leeyqcdhPBwZHbQRUk4/l737SbbGkvToTVSV0UxUglMpb005IqEB3jvDoMje?=
 =?us-ascii?Q?T6ikrBRZrcm5Csfs10Iz/nd1imw3BGpFn/bVIGl2m4eyw/GZ18dg6P5ZZjNm?=
 =?us-ascii?Q?a6Xi+KA0/Rj3d/HDz5gxxXK1ualHvA2ewhgfjTqAC58EMucjpvvydfNjW8Rg?=
 =?us-ascii?Q?Dr5L1pWi4bhL6KJ/zPCGcLM4HdS55V5l+C/P0cYQRN+4iyElVk/rlkNw6zge?=
 =?us-ascii?Q?lNKaOjb3voMH8mVFBkVIZYtRrTigIyAvtUUz/sikHWU7xtwJIr2mmbaiOzr9?=
 =?us-ascii?Q?VcXVa6+HhCzOD/GWB+OEhUala6Sw9R+FVpVhXyO91nG+x0SZY8rNxDj6g4P+?=
 =?us-ascii?Q?WTHCenl57dmS73Xbxtf9nzW3JrkscqmNUzB0eCDPB6yyN8JsA4fFt2yXF+E0?=
 =?us-ascii?Q?PPipIWcpJ7Cpk/S4hvwql5PIZWdE9ZU4JPelXHUKRiELzPor6eDDjZdXSNDU?=
 =?us-ascii?Q?qDkftJGkVPc5NL1mF3dqhtkz1o1amTn/2mvhZFISbw+UZpAbK1gG5T9BwswK?=
 =?us-ascii?Q?AaJth40I5KVvexhF/F3nwt+guTVhHz/BjOMqRCxRg/NDtOkrt1f4GloiPxC4?=
 =?us-ascii?Q?V5NVqM333cIov/XKPEXo8odPuD1EB73V4dUvpW3BSIuXptjI1fdEkrykdvsZ?=
 =?us-ascii?Q?Q0O1A+byCZSDpbq4/1NoFcdnRsiOurXrHznIGkUeA8r2ek6RNOl0Wanwg7WI?=
 =?us-ascii?Q?l2BnJnZGH4pBJJPYc4N50n1GFzFMqQwbwewGunhvKim46fw4PeWzxeHNfSy0?=
 =?us-ascii?Q?k7Xqsvd0+a67JCHMmqzR2Av6pbTFK9Vi9SOcMeFX1nt5gOu0ewuc1oIEtjwY?=
 =?us-ascii?Q?RqofeYVPAsn/tfcsafWqOo3zynw/l+eooRHAB9RQya2348K+FRWaRFk6xM9X?=
 =?us-ascii?Q?ce2MbF3B61IfoSijbJDxkRK7OU1Lxx7ntzr53wJqbYPw1GiGuqGnQn7FvZnI?=
 =?us-ascii?Q?oGkxKEKW5IKJc3/fh+CzwMC7pZwEBRxUoqrTZ40BtXY3V46wdKzz9cz3Vn2/?=
 =?us-ascii?Q?tTq4XdpDIl7KhEjuQ70jQkg+9GRhMXm40wtALm3l2fIMfEsSWGKl8BIXcpPn?=
 =?us-ascii?Q?xjkEeU0undwm+HKdMUsmuIZqpEPRDoWR5T4+QPltLtOmGi+jOb9v6+F6Vtv7?=
 =?us-ascii?Q?0I4sA4Hl6YOsxnxciUOlEWKMOs6ZMZVlNSjYBVB5IwFjPtg7pO8OgxsQou08?=
 =?us-ascii?Q?05Von72riUOm2HUQPJqXo/PDRwU7SZ0eEXhazi2E5VbGlh6k1nIelNoB/DQ8?=
 =?us-ascii?Q?Xbl/Ds2hlligcD5P1SdBMcVh3B/Dmw0Q9vH4IbuU9c8ThXFSWVlD6z/E4hLb?=
 =?us-ascii?Q?lTq2fdkCiTgeCaOWbHUDpISN1FOd9npdGxwMhvDbTUywb2ulvI1XxrPLvYjS?=
 =?us-ascii?Q?/6ZNjqMJxg20tIcg2pjC6X7optzlJWl7UsHZv+1iOoE7uR/jjGgfQ9wyMNYK?=
 =?us-ascii?Q?lPxQkpieTg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce96e6c3-6bf7-40df-4c6c-08deb507d090
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:03:50.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/eo0aejh9zpSHMxuIxcdpGckn1/UwOrq5p5K8Z2UcsQb47VVmdUsmqG0SDuL8lpdw+WEWnKvuAxEaRxixnxsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8114

Refactor the GSP boot function to return GetGspStaticInfoReply.

This enables access required for memory management initialization to:
- bar1_pde_base: BAR1 page directory base.
- bar2_pde_base: BAR2 page directory base.
- usable memory regions in video memory.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs      |  8 ++++++--
 drivers/gpu/nova-core/gsp/boot.rs | 12 ++++++++----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 659f6a24ee13..775cdb653830 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -20,7 +20,10 @@
         Falcon, //
     },
     fb::SysmemFlush,
-    gsp::Gsp,
+    gsp::{
+        commands::GetGspStaticInfoReply,
+        Gsp, //
+    },
     regs,
 };
 
@@ -260,6 +263,7 @@ pub(crate) struct Gpu {
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
+    gsp_static_info: GetGspStaticInfoReply,
 }
 
 impl Gpu {
@@ -291,7 +295,7 @@ pub(crate) fn new<'a>(
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index df105ef4b371..842aef403f07 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -36,7 +36,10 @@
         Chipset, //
     },
     gsp::{
-        commands,
+        commands::{
+            self,
+            GetGspStaticInfoReply, //
+        },
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -148,7 +151,7 @@ pub(crate) fn boot(
         chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
         sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
+    ) -> Result<GetGspStaticInfoReply> {
         // The FSP boot process of Hopper+ is not supported for now.
         if matches!(
             chipset.arch(),
@@ -243,12 +246,13 @@ pub(crate) fn boot(
         commands::wait_gsp_init_done(&self.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&self.cmdq, bar)?;
+        let info = commands::get_gsp_info(&self.cmdq, bar)
+            .inspect_err(|e| dev_err!(pdev, "Failed to obtain GSP static info ({:?})\n", e))?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
         }
 
-        Ok(())
+        Ok(info)
     }
 }
-- 
2.34.1

