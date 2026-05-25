Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C638910C
	for <nova-gpu@lists.linux.dev>; Mon, 25 May 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717549; cv=fail; b=UijS0KUAYPRb4TParLMs+IF3SM7AmDy3BB46JmSYJ0yKKRQyCV+7fWT6iVnH9VcWmYLxsNT0x6B2IEAhI3CrWC3c4aJXnx1rG0luF8V69fFU54C6OzltRD6AFtpLKFmnWW8gHTblQE2nvDsxWEBRDEX76Qx3gXyvSTOWxitaJ+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717549; c=relaxed/simple;
	bh=nD+kPCCE0QeCqLYdVyjxQQsME7PyNHxjMcKS9xh4Jvo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hp44z/h8QdMKADvssdoAeOapE9bWJZyfE+ra+ymt+9LVitlWN5rFdNQDo1OH1YuNKpnhDm29MAnKybidGoqsCznsoN4Ffa1uiX2TQNu9ZfQ4y0+IeV7nlHKSZYvjUUYXQO9CJqpq80HrkWEP5Uie1Srp54cD1rA/H4JKatUOCfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mphsvI7g; arc=fail smtp.client-ip=40.93.195.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mphsvI7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en9L3yyv29CySjvsr9ko0h1Npbugys+2Zf1zDcMHlwvrmZ9MwW18NZq3BR+lrVyq/jS3AqaHg64RUoOPmdKvV+gZe0kK9KGs99+iS59EUgoxVx/Tlonj0BUPgCLm8R/Tu8M+s88j3hP6Q6g9vU9+3uJfCXIqJ6XDQyeWfVIBTYTrRORKPThZZPqjEltmYQx/6au27aLGisVBBsMTvEvE4a6FMQxRWEbO72NByinGN0pdKc+dSQ7FrRqmX0Q6qosxtPfipQKtzB3/LdYnbP5m0JXMfjXvlpUnc+qzhCeOh5tO3h2emERpQ7UoSQsoDodMCZnNT91tbGrJ2wozsag72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9WRoAbgZn4F+IjLqaVeEyfdrBQA5KppAxREOnlnc7U=;
 b=J1HZlS+XmPD2Xm8PHh5ioq7QLgRT0DlVNSB/9IBAzdq8LUSdA/NQAvJJGX/lf83I32YyXOF3MmTj8J7dqkbtKkIZfbGOMmcnWsRuiVIbIW2l+naRjDG0qEnGolXMvfJWxmNyx6T+tucLkqw//esiSFWcJKyuYkrGKPaFxAZyb6gpzRIsMb2n6r165SY8ez9slRnk21QvRd+6tj3mdxEHiJGv3SI8bjt0Ov7Ktr8JjWUTCb8SQg+HZfs6mRPizrWetj6joeU9pG9Q57w75XI3+OM5J5VOwPPY629OpJPBIR6EhyxeLyyQoxJ0nXai5Er7PK3pvQ19fWUZAl8opmNBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9WRoAbgZn4F+IjLqaVeEyfdrBQA5KppAxREOnlnc7U=;
 b=mphsvI7gqfTdqfaF5NeUAGD9ayq4A4mhSb+2aVwrKBcgSg3SYB2eeltOcGLcMyDyxw5d8COeezpYhwwk/HGwMGbTl9JN0nHMRtIMvP0dI3X+B5Tc6nOhzr5EC0Gz8zBWEL76ykJml6VvdM0Ym1eifBAmlA8cZ5kmVwmgLBNdZ9nCD4DgDcFtqpnc4JyNmeV5HnXxd40qiov5iS6W80c68znrZkmwL8WVoRJZu8wrGivoGokh6DApniU55qQZ1Bu2l492KL/C8+S5/z7xXOmGiyOP9i/cXAj5eN402I+oYb7DCf9rUyjMAA0rz2oCPI+cZ5NBIN10Kv+4l2McnrW4/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 13:59:05 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:59:05 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 25 May 2026 22:57:37 +0900
Subject: [PATCH v5 19/22] gpu: nova-core: vbios: drop unused image wrappers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-fix-vbios-v5-19-e5e455251537@nvidia.com>
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
In-Reply-To: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 118652ec-a297-415a-9189-08deba65c85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XXdWSOhj0gwuhEXbecncmCfM30YiAUpNYxom/+2Iv0zHxKNyEWIu0OW2IKwYDOGIzBf4/Dg+2Jkn3jBhYB4TasZ4+ws/IV7gnUVxPYFPEXv4BwWlPnf/hDNJSnd6qwPi6DIviEH96EvqhSzNaVB3olqbh28eY/E6IfxApa+J+GX9/gjFVnl/eo60ucqHf+0PcMh+1j/fyPd79UJizmPtwW+boRJrmB9cWmT8vSnWPlurPSUnGdZ2/HChlrjcZ8D9euust7mXeBhizAfOUWfKfBGzDETaOHm0s9zsdbRu+xoIw/+nFvo9tIl7ra06EL9ofQVAQvJT0hrKKHhjFI+2e9iOeMJ1cfXUjFwSldBhWbpNmjQt5+TpaNOauTHtfs8ekIyl6iaNn4EGjI5byE2WJjptArZriJzzAJW7hHzb8x/oQSBDDFcq0fjLe6XFlHQ7p2YEUqXhAPvQtF+Nk1CzS8uHV2/C8VI1SAF7EHYoQ7RlK7bER5SK0RTb1t0BxWOokGnsGm2zt282evIr8L37fO0YgzraxUysAVoOl198cNxYI1P/mlPc/Bk2Sbf/s5R+Ez6Nrcmvt9qPzXFx+3ysdMh4rdUalqY3J2yxgOWloQBN2nH11eEad1eDl86MlYptPwbqZ5c6YQAn62e98H6zfifArzogg/+JAZyffqjrZWwp2DTC4pVSocjwu9SxBEl+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEJIYW9NemJRMzFyTDQwYjgrcVREZDg0RUFxODAzYW56ejF3VUIveE5nUTU0?=
 =?utf-8?B?SVlZMStEd2JCcTBkWGtQRUZ4dEVpbXJQazA1b0I1bnNyMTVuWkJVajhDM0NX?=
 =?utf-8?B?ZjdjdFdockc5RzEvNEVPcnRWOCtScmJBTy9sUkVheFVJRElpUHhtQm1IT0hO?=
 =?utf-8?B?WktBaEE0VnhjVDM4dzB3aVMySzZKa2xQQjJFYmExU0oySmk0UnNaVVd5Wkda?=
 =?utf-8?B?OVZIZGkvc3dCZnFZQ2Yrc09lZjQyWlQ3cGQ1YUswdXVzajY1UkY3bi9MWnJv?=
 =?utf-8?B?SFBQOW1mOFpYVzNwdllWVWg1TDIwNDlEUS9aNTVrWXVpZE1ya1BuRmU5ZkQ3?=
 =?utf-8?B?R0lqUndyeW1BWURPQ0xsUThKU2pQSGcyWjJMMjZTK3d5V2xraEJIZXp4dnk1?=
 =?utf-8?B?WW5HRkxMNUJCMG9LM1NXZ2xxbGlHNmdocFlzRERicTA0ZWUxdElMdXBodDJv?=
 =?utf-8?B?eVNlb0MzY01FR2lGblI3Vk5ZK2QxT09NdTFXdGQ5N2VFUUhiRmE1ekpabXBF?=
 =?utf-8?B?UnMyMnh0TkhvNnZic0QwZE43RGFMcHgwN1BKT3Q3M1doNmZxN3ViUFVHckNp?=
 =?utf-8?B?UThmYUdEVENDZWswejl2Y1hDYWpsTXRsOUc4MGFDVjAraVRhY2pvRGR3S00w?=
 =?utf-8?B?ZzhpbXpuSTFsTzA4cXQydkJmZlBjUG90M2Jha2k4dUU5dzNhTDg5RGV1Tkls?=
 =?utf-8?B?VVEySk96cDVFbUtMS1puZTQrYXQxQXI1Z2ZERTNLZ2tXUXcxTVBxeTlLeklx?=
 =?utf-8?B?YnlRRVJkTzlZamhXYW4vZWdGazVHajdWc3VoU3FJRXBHcE1sV0x2SUZQMmto?=
 =?utf-8?B?VWNSTTBFOWFBRnpzWWJmUzdhN0N1OThwT3VTcTM4NWtBN2xUTUwrRkwrRGpv?=
 =?utf-8?B?OStseWRBS0czLzZYNmNpb20yQm9qSTN2eWI3dEtxbU42azExd0FkY1EzcmJk?=
 =?utf-8?B?ZUVqTFhnVGRaMVBDMTMvZytjKysydGpiaG10bUFxRXF0RGs4YW9PejNBWkFH?=
 =?utf-8?B?Nzk2MGxEODZTZWpHVWUwMDg1aHp1WDR5MXg2MXkwcE9LdUpYYkphUHA4MG5X?=
 =?utf-8?B?SUZ2aUxZeFVMQ1NHZC94dUFTcWhLeWI3bDdGRS83NHBsK204TnFkRy8zOEFT?=
 =?utf-8?B?Yjl6QjVPRWEzYkcrMzIwTFloaThMU3I3d3VJRWRRd25JUk55dmNDRkQwbDFs?=
 =?utf-8?B?aTVnVktSN0w3dU9yenVNUW9YUmtMQUpXVnBtdWdQNk94VFpKV2pmNUV4SkFr?=
 =?utf-8?B?ZnR6VkFmZjRnY3BQMmlRVVNQMFBmdnhKK2F4ZzFTc1g2ZE8zYzRWUHVWQitZ?=
 =?utf-8?B?amZtWVpGZ0lvcVJidXBDcGNqc2hlKzRMdzMrRVFmWDA2eGhzVmYyaXVwbG9p?=
 =?utf-8?B?ZDd3QkpZamg0ZTlOYU8rRk5jT09pSnEwcG1nT0YvV0N2TWFJNDZDSnYwdldv?=
 =?utf-8?B?eVlhWEJDQW96Q05lSnIyNzFIaXBXT2RUUzBvSlhkOGgwVlMxMmJXbkRIZDVo?=
 =?utf-8?B?TFdpejVqa2svZFhwUnZPdEhRbThNYy8rVlBlZnBuTnNMUmVCUXlXcXJTM1pP?=
 =?utf-8?B?NWdaRks0S3RuNmdtbVY5cFYxaXBINnBvVU1iWXBML1AyQmhmR1hqNmVYVXB2?=
 =?utf-8?B?ZDlWdUpNS1ZsYlhNVzRJNCtia3lDUWJIQUxDbzBTOFFLa2JFVGhId0ZQUGFu?=
 =?utf-8?B?Vm56c2ZoS0hRMDJuR1pXY2NER01FejJXaDRFSXZ0N2wySUM1bmFxd3gvWVhy?=
 =?utf-8?B?WDIwVDczQ01qVjFUa3RKREdRVU82U0FMRlJSaDBnVXpSMFd4a2FteUZmQkNY?=
 =?utf-8?B?c2d2amUwdGtLUHREM1dmT09JT2RONElFQ0Z0VEdhRmRJd3dYa2Z6YnE4ZVVt?=
 =?utf-8?B?TnRBTkdranZzQ1VpMXpSakU0YkQ5SnlaaDZzWnZ5NFFnUDd4SFpUam1qcDc0?=
 =?utf-8?B?amRPSFVRaHZvN0wxeTZrc2UrbzFwNFZQaUF4Smlib0c1MFplZ2tDYSthdTFa?=
 =?utf-8?B?d0phTk1kTTNVUFNpamYyTVVNQlAwQ1J4Ykh5NUdzclUxWnR0dXZqZnFmWkxO?=
 =?utf-8?B?b3lCNUNSRUd0bnN3dzJOcEp0YjlBTHJFdFdRakd6dEdsV0xUTS9Wc0VuRzVN?=
 =?utf-8?B?VFgydFg1ckE5WjRYeUp4ak42bVhRTnRHWGJtakdvTEFKaEdjVk1yTW43VU5o?=
 =?utf-8?B?WDJoazR0NER4cSt2SUxSTUhPUFg0TStFUmRwbkpJWGpMR2I5YllVU01pelhx?=
 =?utf-8?B?SGs5M1BkVkV3ejdJczNvMWhnZVY2eWQvYnQveXQ1VGYxVTlRdXV3aERQY053?=
 =?utf-8?B?eGx1dW84NEF1Ni9UQ1o4ZXdnY0RYUnBVV21WQ1ZzMTlSN2ZrVkhoUjVCNjZs?=
 =?utf-8?Q?Dp08l2TR5URhUtPP/ipNMjl0RRkpwADAPrePC68LfOkBg?=
X-MS-Exchange-AntiSpam-MessageData-1: yFBiCNlAHkvPEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118652ec-a297-415a-9189-08deba65c85d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:59:05.0460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfvBgfTSiFzFYu9Mz7uZk0avmdRFBvd+G3h75a3hPvsujQa+Jgtpsv76X3h/6f35+k6d0dCwcx5R5HGoPlHe/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628

These are unused currently, and it is probably sufficient to just check
the type of BIOS image in the future.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 7399f2d087a9..5401702acee4 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -656,18 +656,6 @@ struct PciAtBiosImage {
     bit_offset: usize,
 }
 
-#[expect(dead_code)]
-struct EfiBiosImage {
-    base: BiosImage,
-    // EFI-specific fields can be added here in the future.
-}
-
-#[expect(dead_code)]
-struct NbsiBiosImage {
-    base: BiosImage,
-    // NBSI-specific fields can be added here in the future.
-}
-
 /// The [`FwSecBiosImage`] structure contains the PMU table and the Falcon Ucode.
 ///
 /// The PMU table contains voltage/frequency tables as well as a pointer to the Falcon Ucode.

-- 
2.54.0

