Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB07403EA0
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471873; cv=fail; b=V2RNSqE6aTtCOMVASNU4vuFZFB0Za27eSPdd3vzgTBsy4vecFFjLx+9F+mlzmtssJlOelR2QYn7+BMZNyLPUHVKeoQRa2UM5YHpXV7OZ6S6vy9xvEY6i3iNz8n35bTwwZ0OV8pJHnjlVUMT9ZrdDZXfuEogwaZfLxdc9bqTiE+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471873; c=relaxed/simple;
	bh=VYiZrqIZ7uGkBUSthEX3SSZmssp6Zzla9g8EIKZ7QXo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sBiLKA3L1P1eLZXpe/eg8vd4K9R2Lv9c9KRW/5kLVQXxYmQ0TMrxgb3HupL3lFAVcefIdyvO9uGQA76ZH8sg+CX/tptmhOI9LPX8hLACYvNqWds8s1R5MdM8gC2dZyKENB/GAe6kQ18iGDib1wxSFeCapscnkwaFyFS7UIEew+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QkuL8Yih; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QkuL8Yih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xePYQM2VjuaP/RGKZ2GY/b5Y7P1cBp0ekkacH3gpRY0Kq5xy82/109Y/ZgVxFEhDc9VStKpZvtZI2AtGk38zgLXkGVDXh9IHV1J/lYTBiCV5vG2AO2nPFoHCPXU53Hsz2u3RWXMbdiwn6FcutvoxUCTbGvOmhuLTKr52ZSQzVxrSfva5gJ+4vSyyAhOKz+vZzSwZA5qIRM+Tif3iYp8NJgKWdqFogc971eRUPqUC/VN0lj+A60J8fhe7wVhaQmdp8FnGJXCdgcUXEsdksl37+hzKjSeNkAGDInmybqveV7PNJcUfrW4gyBjGErBHPh2JEhETerFM3isHoAy8loO9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TK57+4ozx9OeG2lo7IfsjjAc4Cc2o4ysTuPDI4Jlw28=;
 b=vHD9RC4b+KW6lUHuDFw6M15XPgAxxGOYTQPhg1B3ssMW9yjxkdB2EGETyrWadVgYhhOZbhRCYh5j9bnu8MEx2QgL2pU/m1aTcRjoYE6XoexkD+KE27lbyHq1KGc2PAEiUiLC3uK4wquYEs5GwTpqYCAmBMqoVWqCdGEwP3JknF1pm47cdExefKO9nm5vJc2zdWB7/JwvvzjUuH2KRsZ/eXv4t7OAFTm8/V0bMe/Zmx/FyawNm/uLVLOjXOIbywFLebNORK8VQh5g/lfTajwK8lZr2L2bzx74ysKghUU9X59IF/ys9rE1lcNZJ1j7aNqHSh+cFDS4xtmXEKqw30YkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TK57+4ozx9OeG2lo7IfsjjAc4Cc2o4ysTuPDI4Jlw28=;
 b=QkuL8YihOZS9C0Ar+e/bcrB0CphcwrUM6xUxjx4BujwCd5d/EfRzR6+6UQtyMk7VmPI/EojGKj3TBrnt4GKfnuJvrTnkmtnzy5/3lnm38qthhkFMMQbnrM1B3UNINWMOf0UOHGK00lc8vS2U5hkZOFOPcDqzWZLwzEn3Yqa/kvVBggjIzjRutu6HijGsd44nxw3GS7dNVRsMGa+fF6mbyX951tlTEvtJFiUYdguC5fEuZw+kt/xuslcmsAbUpjzYaA7uaJwzLkyTfIeWW9qdWDWY5M4tS+JJkmfhJcbAfJO6KiQ8TqkeH37pt5U9p6LaqoZHkYxu2H2bN92soOJanA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:31:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:31:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:25 +0900
Subject: [PATCH v13 8/9] gpu: nova-core: add non-sec2 unload path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-8-d9f3a06939e0@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e61d067-a8d2-4d3f-5554-08dec14213c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zWe8zzrKdtjTp9XGbHfoReUMitO3JpCZjIbY6jiJk+yhuCpl/uTcQN4OalR73uGrNYVdc8ZoICVpVUYym7GGzcmwkRpOaBh9isfTtSlRlaIM6WGIQm426oJxxmL28Y+iSuRM9jQluZU7rp/RMM0bLbgrn4mkDgEt6iJ39WyR7KyGtKW1Sajs2Av96rzIDP2f4UzIKqyQqdki3iA2+YA6rEo9WTbXd/0Snu2Z+weyyOkvBRGM3w0wOiCCCSSTHq0B8734aHt9PZvlYSVj6Kb4TSy90Ng2JImtGDbkhnlMJqznRDzb4ciZXMqKp206o+7hCY9fTC1wbjDvAi1xcgtbqqPZ4HaQOTdZJgnqmsTP41rDq5wzReAhNv7BCNzA6TyY6RqvNkPUehGf3axFl4ZJupOv/JTMzMfks8v8h+z+jECtqFwaPZcvErzlG2uZyXUr/lBreS76vNibqmVi3iy+r04zK6zhsMoVmZdX81+FKzMuQxSebAv7nCA6Z6RJ85NAAbXad2l77+3eFRuB0vv/v1bzo/WgNG1/dJ1DbH+yqnjaOtEg0JvnD/7kAojUVzdF33hwogKQ+xzM99jgD22l/CjBLQIH3czh/ESgKuNolBlfv7siv33RfJRhuqJqv6vSHllKoVvuuto3DB+iqaNMpcBGvmPSdfBBpX2ivFhh5SlwBEZl5dqwKVvdG1Xh7vP8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZYdnp5dFMxNzB5RUo2OHdMUG0yODQ0ZlIzd3NzSiswR3RHeEMzZ0NmdGVr?=
 =?utf-8?B?TXAzMENjUEZMb1RrL09ud0UrMDFoUlZkYjE4YzlFSEVWandHV01pV05PRG5R?=
 =?utf-8?B?NlNXQnZZbExLTTFWa1BzNWFxVjYvWTJCVDk1bVBQL0k2UGpBS1orSjZzSHpE?=
 =?utf-8?B?bnhMNHE1NHhpeTE3YWx0UmdoenFOTkY5S3duTzRtY0lkVVNRUDMzbVF0MXRo?=
 =?utf-8?B?YnlURHV3UnhDV28yYlpUMVB1N2JZUExPMU94RkttQlpxN1FudEhFOGs2WEJH?=
 =?utf-8?B?NTJMSTlWWWtkd2tDakQ5dWJxSzU4dTl1WmlrTVBubW95Qy9MTUhWNWYzT0c3?=
 =?utf-8?B?bGpRNkwyUDhlR2JzOXFORG5TNC8vSGkvOS96S3FLcDF1c2xQNHRwaEhaZW5Y?=
 =?utf-8?B?WnBkeDhyekM3MnNEc3NyQW16RlFFMEVrMlFLb04vaXN4bG5iTmF3SXp4dGFO?=
 =?utf-8?B?cmxsSUdJT0VBT2pxak9Jck5lZXN2alZxSUNTcDIzR0VrNUlIQ21xbjNxc0FH?=
 =?utf-8?B?NEdvSk4zQUZUOEw3SHAzcDZZRzVwSzhYTktqa1VsaTlVZEU5VWkzZEcxZ004?=
 =?utf-8?B?dU0rKzBXd21YRWtWK24wNFVFek9QOHo1TGFRei9RZ0k3eHpxTm1kYlkvK2h1?=
 =?utf-8?B?dU1LcHZLdFdwUFRFRWZ6cVF1L1ZobVFCdnl3aEg1dEZGdnFobGRuOWs2TFdL?=
 =?utf-8?B?NDJQOVJiMjZTQTRQSkkvZmp0Snp4d0Z6RmptZG16SVY2aWJMd0tjUVBGcVBy?=
 =?utf-8?B?MHpRblFkRGRueDBiaUxUZWNYNk1YM2h5M2sxamt0b1psUjRBakNjV0l5WVlw?=
 =?utf-8?B?akFxOEdnRElnTFRERlF1VHl3VzNuNy82UmVYeGhWdjFVSng3S291eFhIYnlk?=
 =?utf-8?B?SHliclNyamduZ2kvUzZTZCtVN2V5NlBneDg3U2I3MkFMSmN6L0xPRjl5Yktr?=
 =?utf-8?B?a05nU3FNVUZVS2JPQUF0NWNYZ1JlcTkzUEQvTmVxbTdJTGU4TDgrLzZ2cGlF?=
 =?utf-8?B?NEhHSmwzc3B4K01wUk5WdUhtdU9IMjNLUFliQ1FkSGpTSWJBcUxwREErTXhu?=
 =?utf-8?B?aXAyb09QSUp2MHNicVd3cC9aSSt3NlhzcWxxNGovWkVHc1pTUzcwbVJNNXJp?=
 =?utf-8?B?bHJvMFBJeEV6S1JJWEtzdjBiR3FMSno0VFFGa1R4ZklRaldQL0FzMHRrSkNo?=
 =?utf-8?B?T1V5L2Q3R1l4QkpTWW92Q044eGsyeHZKbVhUaG9aOUFCY1ZXTmhYOFlLbWxS?=
 =?utf-8?B?bEZqZU1ZRC9vOGYwcFRuWDZxdXdscGl4UlA2N2ViUU9FVngxWVVIYzRPUzFH?=
 =?utf-8?B?bW92NDJUbWEyMFlCT0xZMGFHUHYxRHE5dERFU2V1UjN1bEtubjZIcjhwS0Fh?=
 =?utf-8?B?Ykx1V1VhalppQ3MwUmtlUVQ3N2ZwbndvMCt2eXFLd1hROHhWVko4SEJ0QUlK?=
 =?utf-8?B?aWxOdjJmMHV6dk1VWUNSaUVKV1Y5OHZMUXZ3a2dUdGhpYmhMVU5aQWhzKzla?=
 =?utf-8?B?RlFUdndNS2IrN21xcW5uczFEeVpiMlhnRWMxc2MrVHFpc2p4eU44MW5pdS9K?=
 =?utf-8?B?ejI5ZGV2SGtQTkQ0WHRYcXlQNjZQSWhUblZhUGtJdGFEbVpRVndlVWJJdklB?=
 =?utf-8?B?a2J5NjFZS2E3ZHRGZUZtMEZzNWZqWjlId1NZR3BNbExqRHQxTEhDN3BCbjhB?=
 =?utf-8?B?eHd5ajRGOHRxb0JtTHZtUmtCbmxNZkpQcHFuWUxHWmNuSWRHYW1kekFrUGU1?=
 =?utf-8?B?QjhVWnBkU3h5NE9VRVc1ZXhQVTN4alNXUHE1QUhCZGNjTzcreHJTL2xCd3hv?=
 =?utf-8?B?NHhwZ1BhWWRLSFJvS1pzSmdEd3JBZE9FWFJNdzdsejNBNGRScSsvS3NKR25x?=
 =?utf-8?B?UGZzQklFK0k4WG9PQ01BcjdEcW9aMUFubXJoYWVLVThjOUtqMmZLQ2hWR0RG?=
 =?utf-8?B?YTkzalBHSzJ0YWNDVWFLeFh0eTlwL1pNNm1jb2YxOGZYbU1DQzcwQWgvT3JC?=
 =?utf-8?B?Mm5iQTJGa1A3OWVIeWo0clo3VzBlUm9uMTJnYWF6cnppNnVpYlNIU0VWcHQ2?=
 =?utf-8?B?ejBrdFo2UlB5VHJMVFpSVTNQZitUUjFoS0tVOTdMTFYwUmxLMk5IYTBMeUtO?=
 =?utf-8?B?WTB0dXMwUkszZ0NlZ25yd1pKRW9FMmlBTndiT2daVkE1WFhLS2pRdms2MUtQ?=
 =?utf-8?B?K3JRaTM4aGFVbURPSDNyYTZHK2Jrb0trVjM4VjJ1T2k4QmtZRFM4bDBhWVJS?=
 =?utf-8?B?cFpaTG8rVUJ2M3RxY0VyUWE5WWdVNTBuMjU3WDVaZkR2RzNrQUdYcnVuZmdM?=
 =?utf-8?B?ekFQckVmUTlRQ2Nkem1NVHJtdXNQc0JuTkkvNDBmZE91UVNHUmp4RFpURkUz?=
 =?utf-8?Q?lX5n2I54GAspaFF6EI6uPDBec1KyNk1oV78fi4LW//bdU?=
X-MS-Exchange-AntiSpam-MessageData-1: KJwqn+NFQGhz9Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e61d067-a8d2-4d3f-5554-08dec14213c6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:31:07.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OvdjipuwNA+r7OIUJ7jknufJJQiyggXdBnq50KMlnxfSMikQeKQ6B8CSFX1Iu11GFA8bLS612kr4RqaDiNX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

From: Eliot Courtney <ecourtney@nvidia.com>

For non-sec2 it is only required to wait for GSP falcon to halt. This is
because GSP does the main work of unloading on GPUs not using sec2.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
[ jhubbard: use Result instead of Result<()> in the UnloadBundle impl ]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 38 ++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index def41745a30f..51ac3ddb832a 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -29,7 +29,10 @@
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
@@ -115,6 +118,28 @@ fn wait_for_gsp_lockdown_release(
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
@@ -131,9 +156,18 @@ fn boot<'a>(
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

