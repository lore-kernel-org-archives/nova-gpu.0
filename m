Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D22036F8E5
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370514; cv=fail; b=ojRlLVWAfEvuPICK/fnFTuIpZTeNB+/JxW+J1TX4o/C+ZnodX68rsriX42x0diDryskJ6xZAt66//jmz7S3DSHJk5m03joKmf5NDaBfwhtgWQOr33fYoKUrsr6w8q/UPbxlLOD+y2zqwC1rLSA6XluJtflhsK5bKarvHR8i2j/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370514; c=relaxed/simple;
	bh=HGQrgvVqNVOEshdUiDNUx7cMEDGCCkTlKHs9KWCdlI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hVal3jLQJJUczH2t0NzIwNBYLR1Cj9KL8Z4IuYim/CQRv52TE4ffmdk56ltRSbJvgw6PL5r++h2SrI9KLhkzlP9k+Qq49LCmMqFSa4Ou4rzEJSdGERTnQraDpnHux65SqwBZMs7B+pj5K5GEvtjQGLiry4Eico7Q4wwC9RtLM1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JAEIMYYJ; arc=fail smtp.client-ip=40.93.194.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JAEIMYYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm/vxiSSoY93lq3kTcJJcHPpBm0pvfKLN7EREiY695/xQku66oc5s8Wjj9t39Ibor5aPBEjc7CEFm40B13HigvtmbEDftyngwWTDMvR0IiRq4TzZ2pJP8ePRiiklIXcMgSTt2a1dEdyjARpiNZlwktiUea9MJUu311TbP3k/wF3RLSTIMEP/Fw2444so9S1+mRA09RJClh/GRSWVWrSQi4cVzFuy1wi9gx7CiLv82vmpPiG5yjw0cGRVYuVctAZsjROGh8oTH6s1SMGNOpFmb7gTYkJQ46IQUqv/24Yr394Iv+wnBn+R6vMVunQZPg9D/8fthTRyx5t0O2XiufdqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWJpEbRX7ML22GzJd29lHRE/MRZA01zEfl0Iwff7jPo=;
 b=TNd4iJ98DSCtJxTnQjKnVOiChqn8ybjo0Yp3VbQbxXzQS450f3z58KVSb1pYTJ6OihX76dbSwY5CGjv78zYj7fhBQOl1ft0FevEmZXEUdT12CdewGm+7H3tOOXnni41owU+fb+KT0HzEkijbIu6UXCz9sLOt9OkUQq0/x1TtoYRgPJAM6UdkVUqV4eyuW1JzXlwY+rdNuCzg+77l2+pCTMalqOnYvYhQ9Zw1VA7AA9ULsTxQzq+16bo1E/v1w/tEQ9F5IWhmcDAC2RLw7RVmEh8inxqcoV9cN6e7E/dyHKz+M2+MZ9xsNcVsgM9z00QOwl0RiJ4yRSWxCxwf47Whgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWJpEbRX7ML22GzJd29lHRE/MRZA01zEfl0Iwff7jPo=;
 b=JAEIMYYJggE2TYQ6OLLM6Kzim5aqsy6N0wRhzi+rOZ8BofAcn9TzhUlbz8+gBUAMXxjFejvfVZpUAy8qaGBqQDLLl0dK9ZCJ7PaC6RfPp/nEJ6kCLVvACa3izoziOgO0LUW97O10PEvbGPvYe3+6N7tbdWNtNToiFqFvHGiNvIzfBe+m4fiR6TnkcVAANS7B9WpSBpXd1y3dXy52pPlpeucRUnCf5tk0x0HmMFUMLQYTRVoE8fNkALAti/pGHHZ0vFUEin7b9hxlVA3Ka7GvvqneKDYcBqM1CjWD1zLjap8HEaco4LUV3/+R/GlahZZih+gJ3FWBcEVLIZceINS80Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:42 +0000
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
Subject: [PATCH v12 22/22] gpu: nova-core: gsp: enable FSP boot path
Date: Mon,  1 Jun 2026 20:21:10 -0700
Message-ID: <20260602032111.224790-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: bf376f10-4fa8-4014-0af1-08dec0561153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	6a6rv9Likrn4eFxp9dFiahivhkaq5hXT+/yDGINbEPPGseiLdk+HXoLX/m0z2Ou56MBIllI+Lxuu4xzTLAaNEd5+r1RgXHAPFBFt/GZ0OEc1BvRw4CbQXoQFlrPrcac5yPuAIoldLxtbhKy3VAeZv2PCg18Tf25AWJto5fjmJDw6MKhtwhpqpJaFxh4lu1xw8lADsDF2TecIV3bvhLMD3LHJWRBeM494SEnn6JMJowzrqumgOe3Ft5beB150xmnr7C+LvKLFqB75I+PchhuV2E+Yml7ES3dmEueRMaQu0wciAbHcCb2mBfYm3yb+MxRCUdIIQJKQJskvWYK38yTCiYdWXho3dL4zdUzc4lUYQvrAOiLqDGD9hI30l4RV46ragNKvddIOb4bOQGXNJc/TGFHArNu+ZFWF1YLvtFd2iQZN6JVZPPfZT3myi9Gr77VTMXsLwaObKx6qXhsqpGJa8L1lEMNqxSSwIwWyRWUTcYj7ojWGR/mcg63V3IeGADYT+HxXUUPLf76h6WyggQrD5oMqEU55dAl/5bFcNwDwYsTu6FbqsdK5HJFCaIZxtlWl7b+HcKnQwoXgfmWI1yac50Gs1p9P38ZrOIqDu4GekN6rRD8WIMZz/Pe988gh+6rv1rno/tdQbFnx4R8BATjU9TJBHN2Nc5+v0aKQ77y8cLf9GLr4h/p6hzj8imHfAHch
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mC7ngK8M7WDj96KG5JuT6omqbfvzqQTxZuaukJWVU42KPtOTRq/CF8t/Uyym?=
 =?us-ascii?Q?LLbS++PnHyHPq5C+f7tdNu8b1vnB56AIILU8SQOf4Bx1EMOqr6IEMU3C5hOf?=
 =?us-ascii?Q?0BUgOXEaDgTgdwUuhY3henbTVCgN6Ehz5czFyRz/sXtzCP04YIp0Od7sTYJ8?=
 =?us-ascii?Q?2ZYicZ7OxynQFIfgFuXfZpZz4R6VdyoYY6ag3hs51FsruBADn+yrDmY0uCtr?=
 =?us-ascii?Q?/KWQKgpaKdQJgKIpCTX4qVp9mgLeSDIMe/RSmw0NgAwA07Z8yZG7YhnjzwtH?=
 =?us-ascii?Q?PEeegBPOm49yzHz6U+XzjUiWXgL2cx3RYyFwUrYnFKFSNz6eoC8qGWo7Gnx2?=
 =?us-ascii?Q?NvThTn+F0hywqLOTKWPjjpCYLXKH5sg02qw9XlMg0UWZj6lDtF+20tbvvFKL?=
 =?us-ascii?Q?M9V6vcl5k92e204cBxQBIfs8gYF67PMjCBf+Z2ZJcC9vLaNUtuhlkQegU4xM?=
 =?us-ascii?Q?f8bzVn7UUGWlTFMU58789kegSnHv3l00r/A5Cawk8oy7JVjrk/F6k8ZFM7pw?=
 =?us-ascii?Q?sIki9DYSpTZ5BUY8FbENSsEuqkNUsuio0iSoib5viVbgpndSC52ga4Av3Pb1?=
 =?us-ascii?Q?HFTGFZx9YTlN2xGyNHj3MeBRYJdmg+ff/y/Nn8Fb5u3ZkmStTYx9kEnJyaHq?=
 =?us-ascii?Q?AQ/myRif5XKDQF8Mp0PVeA0NdynYYChvIKPDsde/+fQjOxSQN/Y/Y2eC/LTU?=
 =?us-ascii?Q?5YqbsPEZfJex1+6EWYcM2HY1g2dScPkDLoYANqJKFqpMCCdUlcogxkimYRwy?=
 =?us-ascii?Q?4YOXuaTXgtPgraym+UYJPHaT0V4LQcgZNhmq8h74iPn3eLZbmIXMl0rnl9aL?=
 =?us-ascii?Q?XIFKNe8YudDVF3IHaVLbXEiMst23EHn7T+TOi54YBchTFbpObceHxTCDNTRO?=
 =?us-ascii?Q?VBSCf+0dnY7XayckyxajcQN2mqv43TJXFdNMyOSwfJWXca2W4tO3S2R7zMyW?=
 =?us-ascii?Q?i/r59a2q+mrGCySVQ3q0wrm6Tql5yjV++jgolH65MdiG6snGS9LfLVxwhD+A?=
 =?us-ascii?Q?HOnVs4YVGJhngCYnrZsJhUu1+ZQM1yc8mMpivE19J5E9qGUHqtiYFz/eYusR?=
 =?us-ascii?Q?jwpriha0zNmFcZfOjSF2Y+zysn0HL+k1EMnNsnijFLvXuzv3u/XHcB0iHcdP?=
 =?us-ascii?Q?b/rDrhuxH7M5O7eR+iryfD54z3A5Js35lXHUSFimuHOb1mlUgQPkpbrcpbEk?=
 =?us-ascii?Q?l7KPm9mljgRsjkk9iSDObuLgzxdaSDuiacbgdieAC3v6MER/NJYSGQ5pQOGc?=
 =?us-ascii?Q?Kml2PEo7mZADPaoU9jmWkgOw+YWlpgqYPEldvTt49KOcTysN9Fx8Yy4RKGmn?=
 =?us-ascii?Q?AWdOTPHFXWuYu2GsR+4kUN28exYpKCIYob8oOdhfQdEqw4YbhICu4OtCh5gp?=
 =?us-ascii?Q?vVScwhEf5m0dGJgavzzbs8VqzFY80CBqeDa9MCjAGq5RoBkf9IE0wFflqYBw?=
 =?us-ascii?Q?oodwB+Be179Q3jiWTdDiI+JqC4rhkP4f7wSoeRz8yownyadqHu8EU2RujN65?=
 =?us-ascii?Q?b3EEPW9YtJljxeKIupqlNjfcw9Mymj4nL6gjTHPdezOENJs1KSHQFeOroWzx?=
 =?us-ascii?Q?fbLux+TLn4reFCbZrAqpk8NlBBo5vnqhkToWl9KHYJF4yYISDli77xZok8W4?=
 =?us-ascii?Q?XonbHCTDmCDZfe0BKou02OL5nsyEhhuf1yyE2C2uA/xn24/pvkrnM+bSbW5K?=
 =?us-ascii?Q?9Wq6L+4ZUzD8+k34K9Jn9ELnEPE4daMi1P/4nqTxVCqD6FsqXvszqXkf5xex?=
 =?us-ascii?Q?2P6uTyyMZg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf376f10-4fa8-4014-0af1-08dec0561153
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:42.5035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKpH0rbVevL8DjCNWHKxS/k1N+WB6yzx6PU/eW/hnIGcJYP9EuGjtf/CNM6f1WgJWzn1vqfsK/Re2GXAAbqmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

From: Alexandre Courbot <acourbot@nvidia.com>

Now that all the elements are in place, enable the FSP boot path so
Hopper and Blackwell can boot.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index d372ae85c5bc..93d8a72fe930 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -166,7 +166,7 @@ fn boot<'a>(
         );
 
         // Wrap the unload bundle into a drop guard so it is automatically run upon failure.
-        let _unload_guard =
+        let unload_guard =
             BootUnloadGuard::new(gsp, dev, bar, gsp_falcon, sec2_falcon, Some(unload_bundle));
 
         let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
@@ -184,7 +184,7 @@ fn boot<'a>(
         let fmc_boot_params_addr = args.boot_params_dma_handle();
         wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
 
-        Err(ENOTSUPP)
+        Ok(unload_guard)
     }
 }
 
-- 
2.54.0

