Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C5438FF3
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471878; cv=fail; b=L77+5hbVbI/mwzXloHyVwZVK+LmRZtV6RK/KFBfsKlk2LJeZ+imLygsDxCZ0jp1SA/tYamcFDY0c6iTAZwaFNRq6pJts/sW+QjwhVysHeN7nmc9aZ5FrUPTU/j1WALWInpPMf5epXlSz7IOcgilLizoehBK0/FVKdkRBHHpJqhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471878; c=relaxed/simple;
	bh=IOuavPlK8bDbBpaS7xY+DcI2SovsUI6EjYdLQY/WPIQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kxkejR5A+gP7xkK3D0qxEsO5NZ2HybKsod+biZfZltr98t5HbYYw4Rqo/6ELLXg/flFmpkaPTLcNXiVhhhwNdtsew7y+CGL+LyZkwnmPhfSZWhT5GLAk9tsgRX+9p1Xc+tdzCQR21P6FTJiCnaCXAz/YN+JUWD0MBaAytbPQif8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lfEGpmKV; arc=fail smtp.client-ip=40.93.194.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lfEGpmKV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfXpvw2JSiG/g3d/VeQvyn0SMHS+mSKRU03x3m2G1dk4FgH4gdRwzEni5psU+ugIX+B3kTllmpYebbIlsh0z7rTgs+86o1f6Is9CXiL4wvhQWuIm3UoDJwyghbTcjLElDeCOM7Dy8cXkVCfi0drx/Gfk0bd7gpTVTDab0TjtnBfuuBjJpq0MwcEXpztl12/mIBZD0K19D7RIVJb6D3E5FE2x/CFCgAT0wyeD5om4sgv37ds2sNVqWIeThHRPJ8Mr3WNPEdL3lkUDcHS/IUZRBbPuh2vF49wci4ad4n508BxPj4dOaVv7F3wsOfclTHQ+33rMw6Sf7OpWKj69FZiX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJQ7Au9CfCJ5LqAX5n63V8eVT/7dUOL+QzofcCO14p4=;
 b=KfvNma1xWCihL91mL1cSTCzpZEKu2TVbVF/6B0f30NywDioPz17Yd2JTmC2q9kGSjdMOH180McJFGtFrcLeIC4S7+nEMRaRDm5wK3349BYKX57xMK6/RroUBIWeFT74eyWgQI6RcXJbELYwJ9jqpT06lMNwCSGJ8LrjQydObDFssj+ua7QhOSYbRXTS7THYJ/fueJe5eFsLnjqU4RC2E+qAH8lGIR8Y1gqo2z8umGYBicIsrR3Tew3J5v1ccp7O3AoTlJ9zCplrs7tBHfGhhKioUJF0zGCZ6+OR7m2rdmhCq8zlBjB1OxY01PMSkpjsOa9VK6DiN8I2guffLQBP26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJQ7Au9CfCJ5LqAX5n63V8eVT/7dUOL+QzofcCO14p4=;
 b=lfEGpmKVQVWBKZuDYXNuWtlY3xcxGb7WLNjErxfeizjynoLg2EAuLUkCtrNOX7yog45R7kSehvLrbmMqYHDlGCpRw7bGNO1q0yscTIeCLkucJs1Z+fTUN7wUaOkHgF5SBtGmo2f96RyfSkZwUSmuY3Q8cspbuqEXLJIyVGTZONpFQoLzYdcI6cKMuUNksPZuHHkzgNlRhv3uveR+DtfbA1v8TpBYOXSqZVM2kJStbvBrlOKGo1qQNr/ONKAwtW7aXrNkz35YXvRATs38WdnATi7A++/NACBRQY/daA5nPYzDhimAoguv4driM4P1CMRw1Au37B8to1CXJqHSvsT9hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:31:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:31:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:26 +0900
Subject: [PATCH v13 9/9] gpu: nova-core: gsp: enable FSP boot path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-9-d9f3a06939e0@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: d3078173-83ac-495c-cc4a-08dec1421634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aKzmlU4Mq5Yat1kvCRU+/9342V8dhqL+EDwCeMzAWBHdZfcx6aZVBi2DKAX0jfJ03ScWkkEGwGA6AeItJeSmv6RbxkVe2cTe3xHVuso7XXDODz13x/vAuGKoTwGJ/cEKkxsa8nWeYZyuD+EfmklHk/eh73RGKqak+auvVDyyBPTedaHAelvDK4Pe6iwq57ggGwDbOgWs15OGKr/m1/0Ha7RfjdR8/UtTJ4+Wbh/P0edTvQPC/h/MW3QznJBmMjnRy+OjntodYG7TYquWTMTT0fkGS7km8WLex00kjuxmXCNNHz1ScVG/jIXC2aRY0wKxt9uAoLn+djWKQ/J0Duf08Z8z4clo/oTvf76Kve4lbUaITJwT+iiy2dGFKBgAz4o7/5U/xiUUrfCI1WMI3zx9EYMHknzNrkSzUjwk/3Q0TNuJnpC6xaSV7gYorc9nl5igkvyOFY3tYz3D4U914zicO5FUzcORoONHEWwKu0JXX5WtUMZeMficaXtZ6W2lYGoq3n8QT9maln8JiR27/hVZdUZHaKbE51zTSaT3KCnVoug4v9ek3jtOUD/UmYG1VNYh0sMVlIPSfFOoX1GST4dyOg9CE9WJ0a9/zARxViTQ6R+kcgs9AppDSUkNuXkLTznxGkB4vlFXdcXYHc6FkruuIQygKM9DT41ldGcWW1PuBiHCaS3xMViLzYpz6FFKonBU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmRlY1NuaVNmTStRVjIyRUpGdnB3VG1GRlJka3U0bzRQdWl3djZJaWtaakU1?=
 =?utf-8?B?bDV2OGFWc0l4YWVSUk90Z2RxSG5LQ0VqVWNKWVk1WFhDN0hEVEJYNTZZTXha?=
 =?utf-8?B?bDdkWGR0MUlQSEJ3THRsdUpWNHVmampHZ0RtSUw0K2pLdEZmSEo3M1d6bWZp?=
 =?utf-8?B?NnJYWkNXczNIREs4Z0NxcmsyV3JnTFJHcHB5dE9CWkEzTlJVcVd0Yko3K3JT?=
 =?utf-8?B?TXd3Y3dLWXdHOU5nNFBYT2FTWUlqUmdVMThsZEw1dk5vTmtZZVp3VVNmTzNz?=
 =?utf-8?B?NURIaldCVjFDMjYzdVdmSHdHT00wYzZPVlpsd0VJcWo1NFk3Um1rdmErUllX?=
 =?utf-8?B?STVSSlBPVUhNK0JhbTBkSmtkc0ZGRGozQWlKWHIxaEFSbFFkcVQzYVJoSnIz?=
 =?utf-8?B?a2M3bEdWQXUyYm1vd05UMDZtclpyeHMzQ1FRM1hlSElQdWI5MlY0R1RBV3N4?=
 =?utf-8?B?UHhudDJONGtxNVBCNGJzdUNDUWJsOWJTdHN0OHV2NGlsYW9qUS90OU1DOFEw?=
 =?utf-8?B?cFkvRjV4bm85N1FESGZOTi9xWmZUL0pmQVo0VHE3V0d1clFyd3I1M3ovVVBQ?=
 =?utf-8?B?VzhHMUNKZzM4ckxXMDlURHYrdXUzdUdRdXovTjkvUzFqWVB4L1pnVXYxNlBX?=
 =?utf-8?B?Um0rZFo2cHB0SWVXVVhzUTRXd1FlaUd4QVFsTGZCWTY0NUNGMWY4dzdXUUl2?=
 =?utf-8?B?K0R3Rk52cTFUZ3U0MHZJbHFUTEs2Y2daclZOd2NWNTdXRTZBMHJ1TWlWSnNL?=
 =?utf-8?B?MGJ5NnhMUzcrTmkvVWs1VzR1aEt3cEZETGI1VFBURk5tU2E1RTFKQVFiOEdT?=
 =?utf-8?B?Zm9IYjk5V1JwVlRucGRTc3p3MVVYQnhCRkVaVWltWW5qZVl4bWR1SjFtQ2xy?=
 =?utf-8?B?VVBFWFhNWHk5QnplUCt3cXNkWTIxWXBuTnJ2YldRcDRKOUM1VTlYdHpPL2dm?=
 =?utf-8?B?Q2FLdENGZ2Q0Zno3VU5lSWUzZ2Z5WUoxc0xnRmNJaEpSVzY4L1VXZldFTUcz?=
 =?utf-8?B?NWdVdmNIYnkyQkQ2RlczelpHUTFudjhEYWNiN0hvZy9iMkFvMDJqTGdMUlRQ?=
 =?utf-8?B?UTBNT3IvYm9TRmtWbUY4MzkxYUxhNEhEQ0dYNDNZSCtSQTB0YjhldmtSeUUw?=
 =?utf-8?B?Y1MyS3RQNGlBaEZhN3VwQjVZYXpyS2lvSHZhMzFIY1FnVzhwYUd0OThzR1N4?=
 =?utf-8?B?bEd6aFJKaGM5RkRoOEFkRVZ5eTR0TE1pbkEyc0ZsUkpZeFhNWFloUWI3NTlG?=
 =?utf-8?B?UWtSMEVEdGY5cVhBNWoyaGEyWk1JM3lwTTYxVkhvbDJlNUx6czZseGdoazR2?=
 =?utf-8?B?Q0hXUHhCb0tQUlBDVi80Yk4yUVlOeExYWkdybFVCUHh3N0kxMDI0ZnMrK1hB?=
 =?utf-8?B?aGhUc0xzWU9JT2RoUWY2WVcwNHBWKzhBaFIzOEZTVmRWd2UxellScHNVMzB5?=
 =?utf-8?B?NURnV2d4bDlpWkNZNHRFejMrQkVXVkdiT1ZTTVBncHhzMU9DUTQ5QmhRWWJC?=
 =?utf-8?B?RmVvcGJPdHFVNVJuKzA2WlNFWm5LVVVMOEExcVl3WW1RdDJPRFkvWThJQmkw?=
 =?utf-8?B?cEh1U3k5VzBGV1oreURNQ3MxRlJYYjBoZHY5THQyYVNiQzFaT2lqYStNSTRG?=
 =?utf-8?B?eERKWXJrOHpWU2lQeTZwaEFudUZTaVkzRmJpbVNyOHBzQThPem9nRlJMQi8y?=
 =?utf-8?B?MUtDOUlSdEVkMTNlY0EzdTZZbkY4VlV2Q2htMmREcEVMcUNaRnBnWEswcEgx?=
 =?utf-8?B?Y1FYTmZKTUtMbmZON0RBQmpXQ0VDN2g0Q3pneWpmZ2VUY1g4ckpkRjEvMEdE?=
 =?utf-8?B?TTkrbGFQb0s2VlJaMkp1SG5OeFhFbXIrV0FZSWhaWCsvbW5weUxmaDdxRU1U?=
 =?utf-8?B?UGl4MTlrT2V3WXZObUoySFVtZnNNSXZEZWYvalNFNlhCdG10WDA0ckNkWmtG?=
 =?utf-8?B?b2RWUGVPSjU2MVAwNFY5MHVhMjNvRnNOVTZSbXl5VDVsSlc0cUFjbmpaMkVM?=
 =?utf-8?B?b2oyNjREQjFETzFvVmREc2FSZnlleUVlVUVRZXZNa0xYTGtlS25HeXVtK3lp?=
 =?utf-8?B?U1ZzTVNEdUlLS01seTNkTHF5azFUdmZBN2ZEZ1hycW10M1AwNUlRQ3pta05S?=
 =?utf-8?B?MjJrN253RnFlbjZhTnRzVzBMTmhmUVdGN3M4U1p6WGRmdUNoQ29RVlVsblB5?=
 =?utf-8?B?Sjg0VWh6SGllcnZzM2FCYkVQR2xJd0w3WUQwdmVsTFNtdWdFbThjU2kwOHZy?=
 =?utf-8?B?Ykp3R2VCQlBFRFhyYnJlejc4K0Q4akQ1R2pWNmRPQUMzOVdmb3Z0R2ZRb1pl?=
 =?utf-8?B?S1BDSzNFdllqdVgwbGpBMWl3Y0FnVUY1MnZTVk45cVlFSlRTUHlHSXZCeEUz?=
 =?utf-8?Q?ZstomFk7xfqPQi1kDl/0NYW5GiE6ua3H4DvlsJEsm4VFC?=
X-MS-Exchange-AntiSpam-MessageData-1: Xqfqt7IzaplF9Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3078173-83ac-495c-cc4a-08dec1421634
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:31:12.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75h8zSk4COxNsNZiLgaeSTXbcESiipfP+heffvh1ndJTYMfihmlqMOo/8tD7jyj2UgojHwKs2AFcJLrl3t6DBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

Now that all the elements are in place, enable the FSP boot path so
Hopper and Blackwell can boot.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 51ac3ddb832a..ea2b900e28a2 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -165,7 +165,7 @@ fn boot<'a>(
         );
 
         // Wrap the unload bundle into a drop guard so it is automatically run upon failure.
-        let _unload_guard =
+        let unload_guard =
             BootUnloadGuard::new(gsp, dev, bar, gsp_falcon, sec2_falcon, Some(unload_bundle));
 
         let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
@@ -182,7 +182,7 @@ fn boot<'a>(
 
         wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, args.boot_params_dma_handle())?;
 
-        Err(ENOTSUPP)
+        Ok(unload_guard)
     }
 }
 

-- 
2.54.0

