Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029C36F411
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370514; cv=fail; b=WME5iph23PyawpvSL48bK7BcNanfDo0Shski/iG4cOsGeifOG6xAs+CcdAYGrIwuNg6MH37lCOFnh9tjTXBSlbXq6pXvruGryGSSzCrqtpXPkqaZpkx7PIS1wQmwASPOPz/5qTef9+qOptjmksDLNcS/xzQoTXTgGbbqyGiSVSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370514; c=relaxed/simple;
	bh=r4IlKJk39mnndpMllrl9W5NLiFHi7YJENmlbByxoGvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cp5qTfUtkw1ff18KgH+DsZ/KDulEeqelQes78HcIoUjiCN6m0oDPgM/oPU5MwA12tAI2BLBcQuS5pGYCnnwe7BKT2nf/kbqLJNA2etccgG8OicBHo39qfwv1qgUQL3yaYazRrn9p3xRhwNtmiRtviQhqKjmKYXHKLUgl0FrEUgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p+V27AB8; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p+V27AB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdZ4CdC0Telqeavvaod+Scc51maxub5itxU/QmQsrWC6I2khSqvImWWtXlKbQP5YAguxvnoUymGgyj3PrlHuMlpCcEbAgWyYuTY8PzmqpmeK5mLFn0yDatCxxJB5fV3i3UqTyZTyy3JLEUryJDR8JyntJu8S1p1duJrdgn6uhfYBEubGD0udOCWTBAY/fFhtUsWBbA8xSC50ZgoUXekWVROs2a4SAQS9SklgDPQHEMUqysYMgACGaKUFC5s3WLsvxI0ODNNbheha/Sp74eBWxJg7xHMzNbZYTEi13LVEhp3V7EEWwpBcsnCO19n3V7W7K94d2JnMkVABJOzxcfhngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwVTDhP0bEage9xa2Zq3BD8IwuYGSX4BuiR+zvOyum8=;
 b=TFp6kv7tvOsP4SMxV4wfoRpn6HhJwf2q5Fkk6MYbB2wEBF0NJQcT3X9mtxRwykIx9EAoKnUCMRX6OpSVZG9zwfdQ8a853hhrsYmvkY4rkADVLsup2V+d7qIKxex89tERwXMypscnN68KLKszsI9gOBssxOqVnI/Od9CRwLZaIduj9bKwhGfQkD19Gvdsfy/FEV1WcOkXa2rhSBy/sN+FVtQ3Kvek8N0p2oWlYiVdaFRfaZsNuHcvJ2rPXbu/5OtKl+JfK2606ryX9iGuXgoC9Pg1vrEg1qO3FpNAZEPKx+vgtHzxco1qTVkV7TboPUKFGJipvrpTHnsg5u62PcmOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwVTDhP0bEage9xa2Zq3BD8IwuYGSX4BuiR+zvOyum8=;
 b=p+V27AB8Z3/0c5354vbc8QARW05jfgA+CDTKVmSJHxGAf0cghc5GVwt0lHUp00Fa6/7W2Zzkv/ECLsv4KK25ib8lLH+GLC2nEqDfBP3dupAoPQ0Je/qHdCx8ivBoFLSmeKO3iUVykrbl+L5GyazOld6XtExe1/bU3V+qy/lRkFmDQddPD2V7dS45b6/vL5RgThDp98u5nceFISc3dQddrO5XxZCm3moaWOtEjwUO/SP2Z3yFQd8rc+B73Cu8sq0OXmIu/ZSTCXjiZswCvR+lsTInmuWCiKCDf+XkUAEve9116L+MlZEb/Iw9epR4GgygmkkDtT0Dop+vOtMq1ImGNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:41 +0000
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
Subject: [PATCH v12 21/22] gpu: nova-core: add non-sec2 unload path
Date: Mon,  1 Jun 2026 20:21:09 -0700
Message-ID: <20260602032111.224790-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da49c20-e753-4c29-8487-08dec0561094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	F8YKuH+o93VQt/kWpLYj46AM/BlvnTn9nc2RU1Ayr86EhkrMTwryjQDDGHGtg3b7fwUBHDidhwEAdomNdBFEDhp1fcC1K4Jmywk9C4iWEJ2Fxdrz5lgcl0d5+9/M/5RMAIjr5gafF/Zu60/JKrbrdeGkZMMYlfZsIlykNsOAnlwIs2W1Tuv5m6N66bc+Z8hYcjJuIVwQcHv6HTVQRoDBMObLsGZsbYTsi4iHCc0WooCmWTbMIh+ENeBEXvaIe1AikkbKu02bbrk8kEbF6VnyYXR03nUkOcYJNNFFWQjzgs6+2bHoyosi3QSl7YGolhAEOvEOIKyQHG49pvW4My7n+V7nvZV4vVSPWKMEYNWhL4zLa7YVom9Pdpl6FeMeA1r73Ei7/7CBxrDDfB7Y1DyOPtq+tyYqrVfl/nqeSbvUcJ6b4G0teG4/L83ss3qdpZw9b3bnHjgz2iMEHD8clXh2Hu+AcF4ONYsBYI2lAfanbSa/zhMFLxAjN97PztMPibhmO+nYpZFqVZw2ZjkdvckLq5Tv11+3KVL4/AdIj4i/3dDEQU4oyHSpWnb/DTRUgn2CXRIuXV74ejZXW0qrkXbxDYGvE3OE+TkWTw3/DkGif69FwmxW7wMfgj+U92fiuZCdnG/GwQpSJC8scx1tJT5UzB4AkSnQQcbBUGjaR4zQjpRedfDcbxsqeILJRZYrMWSW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+RmaSEpo6TBcGVnxNoYF0h0nh0fHAGhrlubVuRHBBRvZyhlskaKm5mFxz1i?=
 =?us-ascii?Q?1VqphpNTVOUcr4+nxwScmyUWhlmcnc7N5m6Xumvdkp8+C2ysK8WaqYucRFNm?=
 =?us-ascii?Q?vmV+koE+Tk26kw92ZELfcuEQQPWdWGTZMPedx9qKW/Kh5PtxlOQOKxvY6yyo?=
 =?us-ascii?Q?//cdgfJ+x2XPpPBhgwXbnj2V50TLiygfCCzHNmnnyBFCG1mja73+ZK3RHTO6?=
 =?us-ascii?Q?ql7BXh2uXWTJKiCp08Z4OB4LbpwfioE2Nqd+sGbzHG5E/0rJzs4AsJFFdZcS?=
 =?us-ascii?Q?RwiHxx6sS2Gq+2/UnqUTZhV3js+hDsq92K27sWOMjAiS2nleks2D4/fpS1lk?=
 =?us-ascii?Q?bFoga3Xs1r1qXRXpzZ9ksxYBmP+skRpg6XQ2bNFnSLofIHD2fTeNQmUstor2?=
 =?us-ascii?Q?o0elvLS08H0kuI+NHtaDVkryyU36BKQuwT5wemP8rqO2N5UIFQ3k0LkOMh4F?=
 =?us-ascii?Q?cJlZmBq7UCKpGKXzAMqRCLd8QTYWpz9gPSQu1jr1lW7qyu1qVzD7h15l4C5B?=
 =?us-ascii?Q?z9IFr4RSpdPaXawhk3oYTjwMu/LJIE/M0J+1G2u2qCZUUiUvS/yslUyNWCtR?=
 =?us-ascii?Q?AGId3j7IoBg5GvXZU16iW+erH9q4JuDGtJ3zT6Iw5v1HDoeIGxYp/SBYoOPL?=
 =?us-ascii?Q?4JsJbfbbAeldyp/U+uOGq2mB0H7+jSw1QduSXcvve+tANAY0ANYTnG+oCh/P?=
 =?us-ascii?Q?74i/ZWS4akWJhQFTvuTXp+8gdNqhEkSKuB6/UyepGH5SN0dplcOvs4+IUevd?=
 =?us-ascii?Q?f57CaV2bd8v/0lkYtWYHYjyEnYSdcqDsmhCc/kXm9ilNs5BmYmRO+7V+Nsst?=
 =?us-ascii?Q?eGHONs/6o28Ln0PHRdwQxNz/Mk04BVw/HXRqlDKIwpeeBQxws4jUT4NlVuxp?=
 =?us-ascii?Q?ukdumLauyUtAH3X7Znl0CCxLSwK8K/+ImZFiangjQZuHd5ITpkrfCFWUwqIS?=
 =?us-ascii?Q?BChUXT52fQJFEjBCJPcJ7MDJtHyXfP1aQtWIQrHziQEZiFcXaWUcPfuk64Rw?=
 =?us-ascii?Q?d6L6FgREc0lQWsaqmRpEyN1qZ89ZetE56x5mEplsXWuy1zKF6UDnFtR8c2YB?=
 =?us-ascii?Q?2MFCUlX5GltxkFm18tKViXD4t1vQdBEOM9tDu1ri1FAdqDO1YloYSMW8ba1S?=
 =?us-ascii?Q?7K7mO1PEwK16qlq7X6XHu7226L541B4uaKst2gk4y36UCP7nTjclKRsWwNgT?=
 =?us-ascii?Q?JmLLqvYA8HFztbz8KuKkZV8llj1qqS5dcXqUqOnjfDJtKCcFo0yNtSoI5lXz?=
 =?us-ascii?Q?RNAgZb8VI2xv+os/R4Zx3q5jbp1G8AJCCpoZKZ23REdvRVtvKJbxbk+yZLac?=
 =?us-ascii?Q?Bm5utNTxOXoh7a27dzdYfmRotYXNuyCeqxnlRLR7gJlzj2swOLBo5u44yVKZ?=
 =?us-ascii?Q?uy4qHjExdE+F0LbmeQx5YDeYZ6Shah/P2LqyZ6xBVVC+SXM9x4c7oqr7Xkyo?=
 =?us-ascii?Q?E32p4P8Q7FJE0e+Yb+rBSjLNvBQrH6arI9x2LZPbBBhqm3wQ59adUyUDuZZS?=
 =?us-ascii?Q?bO+ie3FMIHV0pzFWc2pQPyvKOM2wWwkAH4p83g7XZqWmwej4JmjICYeQuhtT?=
 =?us-ascii?Q?Q4NfxQkFD5/IcDvg1C8N153EsuvDE6U/VJomQtdR8ScfI5ojUmxvJgewxrfr?=
 =?us-ascii?Q?k86+1bb9DX5AULOmnKtSvmCU0SSTrJ9KvxpcgchLvZjsEBKdrfeM4DeFxq9I?=
 =?us-ascii?Q?LSgvJyhRImxdWOSwRSy1XepzyqLXu+Ic3X1hBzTd9o6tCrRFhaASZS5zIALT?=
 =?us-ascii?Q?q57/j7sqHw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da49c20-e753-4c29-8487-08dec0561094
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:41.2613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlL+NAsTXQH854E/rxb5MT8nviiBa8gM6J0kp6+J6kRxQCjS9p1GpIUyUuvGGbmNFLT8pQXdsKYxZmrGdsqUfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

From: Eliot Courtney <ecourtney@nvidia.com>

For non-sec2 it is only required to wait for GSP falcon to halt. This is
because GSP does the main work of unloading on GPUs not using sec2.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
[ jhubbard: use Result instead of Result<()> in the UnloadBundle impl ]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 38 ++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 02aec5281389..d372ae85c5bc 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -33,7 +33,10 @@
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
-        hal::GspHal,
+        hal::{
+            GspHal,
+            UnloadBundle, //
+        },
         Gsp,
         GspFwWprMeta, //
     },
@@ -116,6 +119,28 @@ fn wait_for_gsp_lockdown_release(
     Ok(())
 }
 
+struct FspUnloadBundle;
+
+impl UnloadBundle for FspUnloadBundle {
+    fn run(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<GspEngine>,
+        _sec2_falcon: &Falcon<Sec2>,
+    ) -> Result {
+        // GSP falcon does most of the work of resetting, so just wait for it to finish.
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |&active| !active,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )
+        .map(|_| ())
+        .inspect_err(|_| dev_err!(dev, "GSP falcon failed to halt\n"))
+    }
+}
+
 struct Gh100;
 
 impl GspHal for Gh100 {
@@ -132,9 +157,18 @@ fn boot<'a>(
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
         gsp_falcon: &'a Falcon<GspEngine>,
-        _sec2_falcon: &'a Falcon<Sec2>,
+        sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        let unload_bundle = crate::gsp::UnloadBundle(
+            KBox::new(FspUnloadBundle, GFP_KERNEL)? as KBox<dyn UnloadBundle>
+        );
+
+        // Wrap the unload bundle into a drop guard so it is automatically run upon failure.
+        let _unload_guard =
+            BootUnloadGuard::new(gsp, dev, bar, gsp_falcon, sec2_falcon, Some(unload_bundle));
+
         let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
 
         let args = FmcBootArgs::new(
-- 
2.54.0

