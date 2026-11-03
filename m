Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664186;
	b=hnOXSZnRvRUULAWA30QJJWOeK5YmjTSKLoWR1A0+ZTOfhiiSOcawSGun4C5W9Rl9O5RF
	 84bhahlfxYVKOxSrMAr/ZRV0MJNhm+e4g5O7qjp9KPz7pK7MzUKXm4smOUtQXGmxL5QBT
	 0iEYpxuIgkcVGcr3QCS9DmQXTvsIlZW9E7myhHvd+f6MrVGdyvjunYxSQ1pd5/MWBg4md
	 OS7fzrqW0hlnz21g8iUFxeUo84+223zJ/6jGxbBASZnAvslMJ4TcnrRUjPFsM1qlrPTeq
	 b9m7z63E6gnyclaU3YDzLyPii3VogK9z7wqc7BxmV1KoNjkOLEagFo6GUR+2PdAzdJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664186;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PsklbXGDTGNvSHNFVWJ8jyi4OQVEQJN/OTxwTeXLDd8=;
	b=YD0a1QC1o12KTK4vIoXpfIaxm4/UOe0Nw4Vp3Qd+dVxxf7LmhZfuiGS6ElsGkouIsBb6
	 JFnefGsSXivMhqoNeu7x1tSkHtabZZbLDJ7hNrEl8oCfgqxMp7bvXto86RD/g/JieaLK6
	 1+qY7FLFnxUvZC/yLcKQgNZ/NEamI/tdNL9V/j1qm3+69OG3NgUOKdBNmOgxQNS3TWDXu
	 PC61UmiOuT4p6eBfMjD1aB5jcMkI974M7QGX+6avczt23tJy5TK4JIPLMkPpK1wluTzCF
	 CtOdwgbiImorfJmHrWxsd2Wfv+oBeQDf22PoBuhe92uE+GOcZWx41cgOjY2+zFGEdLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GfJkL6j5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.22
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9476606A327
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9476606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GfJkL6j5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pn30tHCKBEH/btlYSJZSSveLKNk6q+mUTcA22K3iiQ6Jss8VumiMxFX0l54IMzeQhgA5Z/ukZnUQo0Bon7u8L1CUpLP3SiD0OXgX3RU+v2KpN8qhls375XAaw99x9eJyWDAaghyWCDlIeaz8/6/zjP8yhF0jNOhRNm5WK6CfYuX47Pwe/rosbjlXlVSrGNZeQEWELd9zpHfJN0ZBkh1XIEFo2yHrlFWHCniQakUZLVtnuKAK/UzzbTmCr9WFUMjKoSkxPlfZqQGX9ioIJfhHkdz5mHCXd0UZF949Z9dfZ9ixNqu3Nt7YCG9JT6vN88VD4pmzFF5ePoeomwlQST0Fcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsklbXGDTGNvSHNFVWJ8jyi4OQVEQJN/OTxwTeXLDd8=;
 b=H26swE9w2bURGlZjEhR/DnJsiCmHcMpjQUlc5XV32SLcHpczZ/FdEduBrdI7kXQMOYZRMCP2CtIafVp+7FOWU1eL3pYtKjM8VRpJyr2hQnrBcN00shIrrzXXpyhdcGiD6FL9y4hTzUsXhAyTesNqi4mLA0lyqIksgHr9288ozEqM26gHB4tTFUUITt7XKyiJNc+piYdVRm/+vYePB+21iOnHiRMGAFP6hWxujeRTLhPm+HcQDPB+/zKyofJHvpexArnEJ5J5NmMx7Qiiys10Lm5MWgdVhqjTuBXsl2s+tzlIutwW24KOf3/D9gFngVBk5EJHH+DMtc3UrNtzkauJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsklbXGDTGNvSHNFVWJ8jyi4OQVEQJN/OTxwTeXLDd8=;
 b=GfJkL6j5q9K24NCLDqBRzZCSuPMuPnJRQ7+E8M/y5NQwPLaXOCbn3s0HIjNf5my/T0gRvJss5L4XoLJIgBdn6DqxCh26ONsn4BHLCZPjSjfq54pIbf3/OgRndgHL7hfIjBklDYQiIMJ4Ft9ff1jHo9Pm53aLIQsumkEhKjvNpcyje25JzmGlrFFH0rlyV6AVQyWFdfjAPxr1+aG31iL5VfEtjy3LXviNJwQs3e6l9UzUXoMG5Cdj81ynVylCYhYLnq2eWRD1bpDCGooJsAJO3fT7piR8XnhYlHRqtXl/qq0mdkCqQjSF6ZP1vAtkgsONrpWML23BUW4bxnrzw2Y+Wg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 00:03:00 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 00:03:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/4] gpu: nova-core: gsp: add support for GMC messages
Date: Tue, 03 Nov 2026 09:02:50 +0900
Message-Id: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBsYI0jjVUoJMRl1hEY7Y4sg3
 r1pu3yL/w9QEiaFrjpA6M3KSy6oLxXEKeSRDKdisGjbGhs0goheqA9Kfsk+PtLTyBqNdQ6Ts64
 N1wFKvQoNvP/Ot/vf+upnitt3B+f5ARoy5kF7AAAA
X-Change-ID: 20261030-r000_rebase_on_cmdq-rpc-2990d9296a8f
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0272.jpnprd01.prod.outlook.com
 (2603:1096:604:259::20) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: fb10a95c-e539-4ca8-b0e0-08df393dd290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|10067099003|261102123227099003|18002099003|3023799007|56012099006|11063799006|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	Pr0Pg281+NOWOWC2WRDUQQaEYnUpPTLtzvdOY1HVDU9lG3HeIR3FRFtLWbqwZX4k8i1AAfYM0pPs5qj/d88qeKl97lVD2is7PaHQk5963L21TGqcRk6MWPYkJylpRjvBKb9I2UWZw0i6M1ZAOjwlDPs2ApvIrJViv2gpsroh0NVFx4EWfzzx0keb7JZCRGrCcCdY1IUPyqMF23ZVXS7sS6qFrSreDWnKwyZDqjaP56IwdSB1vz9XRKWShm5DQTCczRvlWQ3Y2kHO955a3MzQNdnC/028PulHWmF4MTRWc+HO+2TXSz2sUUOt89dDkK5I+LSLzyzFRiu0dcFGVoAytHvA/pmhNmY39DaSrZN4osfDcusNUff6vdtvYxI0LqC3MmUkEy9sTSQKjBu7dIpg8hljy+uETBhijR/8AZJzI+nRrcnMYpMaf+FagGKUfIDM43KaoRw8J7KbiuRyt1M9CV7SmYLn41heeCnHZRFWpVPgVMn3c8wVdwYZ1Pa4pXfIIB1WjODxH9qVmL7mOn95Pj1OoI3+DSLcaI1bRgSdoAVo5mrXmGLiFuO8ifwVDYSniPwa9O1u5urwYYOOH+wpF8A6wVJTA6BfG2zQIHmXGBm1Pgjs+61bHBNJk+oyOG/zBEPH3LTsgyuUfE1+O2wQu+v8JhaKr2ToZZVm/afDeZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(10067099003)(261102123227099003)(18002099003)(3023799007)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG95SG5Pb0lub2ozR1kwVXFUMk9Zd3J1SHlEc2lhQ29ndVJpeFhuWmhiYnVH?=
 =?utf-8?B?akJMbWsxNjBMdkxVWUpDbWFXSndvR1hrenRlaEt2TE5Bb2tRc09HQ254Ry9o?=
 =?utf-8?B?S3ZjdCtJNWs3RWNkcEFrZGdGK3d5YVZBaUZMZWorM2sxaEZwV2Q5ZkhZUEFC?=
 =?utf-8?B?Y2gwL0F3NU9nWXlQQmkxRlFpbVVka1FmbmNvNzVlQjhIdjFJZjBaWVJoVFQv?=
 =?utf-8?B?U3RwRlhBQUF0MFE1UXhDN2tpdHdyTjFYcldGaTFrcmZSU1Ayd29YVU16VDk1?=
 =?utf-8?B?dnJsZEVoSFJRV3Q1WWZWL292Y1lhYXZFZWZ0T3dVWlNEQi80cDlMZG11VkRp?=
 =?utf-8?B?NWlFRjN2ZWozQis4ZW1CcnR4ZDF3VmI0SmFzbjBhMEhCU1JSLzBZNWhOTkVY?=
 =?utf-8?B?YUNscndaeXNHYjR1V0Zsckk3WlVBcEt2WEJPZlAvZmxqZWN1RWtJaGk4TnlW?=
 =?utf-8?B?MjdvU0hhb2wwakFETURwc3ZwTWxCR1pocy9zUTJoUUltVUFtTWNHZHE1TlZt?=
 =?utf-8?B?K2pDeXJzaXE0R2Y4dk45RGRXRDNRdEQ0Smd0NXVreEQvSjRyL3pwbmorQ0M2?=
 =?utf-8?B?dDBmaXVKK01RSTVIOVZab0FZdmlIMnoyLzZUMXhZUkJiVjBBMTJBdFhlZkN3?=
 =?utf-8?B?U1VYVVk2OWxBb04zWnNQckYxOFZuYmE5SWM3WHFRQXNoNi9Kai9Gbm5mZkhT?=
 =?utf-8?B?ZU5jYlJHQmI0aXJSWEN3YTdzWGFPWFZvWHE0RFBqWlNMZTBkdFJZMkVaemdG?=
 =?utf-8?B?NmJseE8yOWJjUzdCNXRSU1hBZWcrRjBmTndSZTNDY3YvZ3RreEdhMFRGSGtS?=
 =?utf-8?B?WEthUHpaNHJxdW1DUzNoc2FQY3VBZnpXc2JFTkJhQksxNkhWVmh5dzByRFo4?=
 =?utf-8?B?bk5XNk10YUtCSFZZTjlWVjBOVFJHQ2RBdVdpeVdQVlIyMUc3RTJwcExGdHRX?=
 =?utf-8?B?VHJvWFhsRXVxQnlwL1A2NFNMRmVXWUtISVE5d1U4RlFqclFMbTRFc2xNL3pX?=
 =?utf-8?B?ZnMzc0gvaldjY1U0L05udjhRZnpLZjZBY05OUHd2amlQK04wdkZQejMxTGI5?=
 =?utf-8?B?U051dzVUdWxoODVZbmhKTlVxZUFUS3BCb3pKRzhZQzIxekJpUHVWcDNRbjZl?=
 =?utf-8?B?cXRMdlhZcEkzVTBqUmsyTEtQQS95UlZsTmZGQldVQ0U1S1RRamJIWjA2emR5?=
 =?utf-8?B?Y3ZjMkxHdEhMTWt5Rit6MFBVYnhTZXZpWDBCMHEzaDdnQWxia0gwcHczd2E5?=
 =?utf-8?B?UzJ6SlczNVRXUEphc29OTm5ZM1dPVEU1RVYrdW9qbDZPeE5TdW1wQkp3SkVS?=
 =?utf-8?B?TzZkSzJuT2VHQzJHL2hpeXRGY2lWUmdGSDluQ2hPbWppN3dyam5KQ0ZZMnJt?=
 =?utf-8?B?WDhLNWwzcGlTaFJtWGx3MUN4anUvMnZnWWR6L3QxcDE1YU1jZzNCM2lyaGxQ?=
 =?utf-8?B?ZjMrNUdYNDhTb2J0c3doMmlyZkpyd3BjKzJiWFdXVENMbVZxWVhVTW1DQlFH?=
 =?utf-8?B?QXErWldpVDIxRGt5VUFPMitaTnBiYXlUSFhoZitKUFNtdkxjU2w2UlRwUkFR?=
 =?utf-8?B?OXVPck9hSDU2OGl3VzdKN2t5allsT0NmVUhYRDcyWEVVdElCMGhBQ1JYTlkx?=
 =?utf-8?B?MTkyNUJxSm1NWFBnQ0wzNkREK2dTWVExU0lqRUdDLzdRdmNLV3pXOFQ2VlN4?=
 =?utf-8?B?cTk4dHA2UTV3dnEzM05mVmZkYjU2SWxyVmNIUHFMSFRpS01jdVV2bVQ4d2lh?=
 =?utf-8?B?cHVzSW9qYTRKWUx2ajhlcUNKTmx0SHV3dktlQzVtUWQ0azl1VVdZbVErK3JI?=
 =?utf-8?B?RWZOcWdya3lVeVMrYm9nMTZKSVZjS0NoSnJ4NTJ1bXcvRk5maGhGNmhEaS9R?=
 =?utf-8?B?WUo3SHRnU01jNTJRRWxHdFJFZHZ2a3c3S1F4SmpVazlvSlhGcVFMODZ0UVpG?=
 =?utf-8?B?WGphZjVEKzk1ejg4NTM4VW0rNUFaSUcwR01VRis5Yi9vYUFrMDFpREVsVFQ5?=
 =?utf-8?B?K3lFeHNkSnlFaE9sVENhR2V1NTJGZkhDeHNDMytOMy9nbTBGa09HRHdFdERJ?=
 =?utf-8?B?Z1hZbnc2NmpCTTdxaFBsT0JkaFljRTlnZDBlTm15UDd6MTBIYkZkalA2MTda?=
 =?utf-8?B?WDFnOC9OWTZrRFNjcVZVUUh5bVVvOVU1RXBqaXRNN0w4RGFRN2FUMVoyRHpt?=
 =?utf-8?B?eTBnclZhQzNPS1lINS9PZzFyeWpwMy9XSXpnanhCN0xzSFVFU3E3UEJPdG9o?=
 =?utf-8?B?RFBHd29kcmVSVHoyZXZGOXpJanVzZnQ3OW1UZ3Q4enE1bTBWL1oyMTlIcFAw?=
 =?utf-8?B?Qi9WK0VqbmUveUNNK3hqVGRxT3ZYVXhoUmJTUEZ2NE9OSzNZbU9XdWZROVJL?=
 =?utf-8?Q?oIxE3r4y+F5U+UcxivaDYw1cN7fS4Xf+YHy+IH2vPs/OY?=
X-MS-Exchange-AntiSpam-MessageData-1: QRDomig5SL7yhA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb10a95c-e539-4ca8-b0e0-08df393dd290
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 00:03:00.0111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ii+D7kNXGAdh51szRICcSBi1YNVhUVyRFxF1Oa+At0DvZWUA33klNKcHcxHpPrYxHOOyH4aSZjtOvSdWaJkHoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

This series contains patches 9 to 12 from John's r000 series v3 [1],
that add support for the GMC GSP message protocol. This code is rebased
on and adapted to the latest `drm-rust-next`, which clearly separates
the transport and message layers of the GSP command queue code. As a
result, this extracted series should be both smaller and easier to
review.

GMC is a new message type with its own header, used by the r000 firmware
for its boot protocol and newer interfaces.

No functional change is introduced by this series. The newly added code
remains dormant until the switch to r000 takes effect.

This series is based on `drm-rust-next` with [2] applied.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com
[2] https://lore.kernel.org/all/20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes since John's v3:
- Rebase on top of `drm-rust-next`.
- Use same message type abstractions as the RPC message type.
- Simplify comments and code where relevant.
- Make `GmcApiHeader` wrap the bindings type instead of reproducing it.

---
John Hubbard (4):
      gpu: nova-core: gsp: fw: add the r000 bindings for the GMC API header
      gpu: nova-core: gsp: add the GMC API header
      gpu: nova-core: gsp: cmdq: add the GMC send path
      gpu: nova-core: gsp: cmdq: add the GMC receive path

 drivers/gpu/nova-core/gsp/cmdq.rs                |  11 +
 drivers/gpu/nova-core/gsp/cmdq/gmc.rs            | 422 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs            |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs                  | 106 ++++++
 drivers/gpu/nova-core/gsp/fw/r000_00.rs          |  29 ++
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs | 110 ++++++
 6 files changed, 685 insertions(+), 1 deletion(-)
---
base-commit: bde6db72e1d70d16551ca2108ae6da2c5cc9504f
change-id: 20261030-r000_rebase_on_cmdq-rpc-2990d9296a8f

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

