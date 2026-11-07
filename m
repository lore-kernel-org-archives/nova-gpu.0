Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044935;
	b=5r7oCx7JtuHiyFUJhxHjnl2BUOqATUqUg+DBPmVhQ/9BBaC6tJRk76HwDI0kOj/3TQvB
	 S1YIi1WYK56cO9DaVP6Yp+t/eo8p8L24X08kgzGHzRDLlXSNqrj1B6wRWmWAhR6iXxPZ+
	 fF8rsNZ+JuEknxHAA+mJvFz3C2I+Mxc/1x+P/HebV+St8PmSWpIIXV+PRyLC4b4Esd/yk
	 rGgOxTqurx5iEe10BG0Ipf72ubUaDgQLzWoeXR2WlczVP/rmbVrnIKDkTxk0BhzTATZYW
	 qIoYohATwDqyMNNGQcFRle37w40EwLtUSbSSbrkYKz7B0JDAatSVzEH1rUSFF2J/aJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044935;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=EV7P7GCe8gwkeEYuiITTnOiwVWsxyA7OJHnrtOp+xIc=;
	b=TRa2yUMwlZPobaQBEgkrNKWl/mdXOQN5ClTl/VfOMPDbAZlwfX2Fv8kqeGL0KDEUSD9N
	 i8arTXjf/YgGphn7fl8ltIfOXY+YwKojRwI5Fn3IZBEXAA19IT621yRms1CzSO6y60tR2
	 gEIdP9SsttyOUt9wKRpuNPnfx+r7QuqGlHKfx9w0RojN0wz0RSOylXLDziNFe2q+bUTJg
	 OWunEyMXOTTKM9hJbYYgymL29OPTGAKlkt3EyK7wO7TR7belZZcthDeOhU6FwcR8YrdHC
	 HvpeJdYpb3+PrNDAQreeeh3tUjxKTtc6iVvY8K84YsgG1aEOFEUVfC8w5T9C10MukRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=phHyA9sz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D9606EEAD
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352D9606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=phHyA9sz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bjp9m7SLIDn0b7sukIyNDQK/X4g7O5xfpHUzzJQHyuvGT+yPzt+riZounPE7YG7RMa0l4CT7t+JA6LHAjf8sAtgwhjLp4xTlyWmZUYFWJjAK11hDdj/P0WQxfZwGoM3j48LVJ10dXVT2i2VmC7usMv59lTEfzDwlWEqgDSqmUq4n7S0aSsH8L0NcSF4IDn1aWz+5Rqq7m0NLa0EKqVu3e2doGI0lP7aepRrNTt4VOEvSBeTJNrlP7iQSwpG7NAWgLYnuptvZMau3EEO7hy+Prx7zzfN2yovpkMKFVPci2mpz5zNUqj4SVZ206hcNAFBDVhL+f30Y66sFiQZhA5jeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EV7P7GCe8gwkeEYuiITTnOiwVWsxyA7OJHnrtOp+xIc=;
 b=uFob3PmRGMEqKHxNd4iQYMhh77kQlYZWW2Qy3J6H5AzeX6bSvyYNwllBO+Ga8RonRCJf6sK+TCo94ZPb7l5VFlASygtNVzM1q0/Ce9j6FYupPpcINl1Q/+4s75/DtEqyJ3X6CMVc6me5MBB6hSJcZ9HwcczpBtmGnpZ5JsQZXz65JzRc3LKmRystNM/2nkNTFBlt3FI3M4rj7GdWOC7ixlP/WbO91Hv+X03DOMd1xJKRQ7uJFJmXMc/VaosRWpeeGOONzRIrPWY89K2qGYsnbevl3jUHbq1FKoxxJfkeHiKP+Dr1d1g+2xhHl7vk4m37sLBUQhY7eYlNE98fgBjT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV7P7GCe8gwkeEYuiITTnOiwVWsxyA7OJHnrtOp+xIc=;
 b=phHyA9szhvz006PFpYwvA1JZ927hRi9y1NZsm447pcyq2vD/oFMsw1+JBoC2or5Bhe3PW8N+7muLyhxxxQSEX8eqdQUfQpGO5Yq4V4E69tCVbzuBo7vTMRfWoEM8yokynK8O1uo/wy5/hDTd42nvVlkxSulOWVQpLhf1ZowMBP1eik0/3rptpHM3q6hzaTVNyKdVKconR0irRZTV6a7sQ/AHLFnwUFNXbh1FcyDQkJ4c+l/QjFRS/YJRBDfZmBui3DD84b0JMiCtujok1CM7ftsDdX1jBMDKI3W9OE8Gld1nWO1sP39HG14DuCgu4DSoZM/D74SAu0pO2xVhJMpx/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:51 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:05 +0900
Subject: [PATCH v2 09/12] gpu: nova-core: falcon: allow DMEM DMA transfers
 to request tagging
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-9-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: ee079376-92cc-45ce-43ab-08df3cb45432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|3023799007|11063799006|261026121527099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	+jx4otWauyYctqWgBK7WEW6A6dHA+jufUcSLqVaBvLHKLs9UoD5WCBCM+jbrK7ALQXwfu9uSm9Eu1dxL05KVVvKVRlVYR8emLSNVGHAxd+qOEO4AgZdZlcAs9YHujaenhvDjV6EF88lhchj6ltryTvPGc3QhnD8lBbK675rxEXWlH0R4g9Xj8SNQtmIdeCWNGVmdTYl3429nMIB9jUJdIpMa3KoWDFpgNx3IOFE0w3p5h8bim4DEkx9YfE6r8wOTUYqEuLXnAzAGL1bC0ym5ZWE+n77XvI1mJBuYaWT6f7292wugjc6fcQKhigdAIEzjLpNQHiapJMD2RU2RY12QAuWR61a8A+nIiNfr4YzS3rL9wUapXq7DH0h0savLShqEvoJQWGwgrqjHqzyzsrM1gf1L+vI/ly0pTr64h8tUVDfakefRS8s6xXsW+oCBJe6ixqc/j06MvLjmOdepbfOf1eFnGs9txRR4+ZI2FOBu/S04sa/6Iai23qFTFIq0IoWfCRKi7f951dSDEEIuyXXpOhERRPFB8qRqvvmoawIta9uPM8tf0SsIJyu+LM4OEX2VcWJtbzuOxBvUGx+OwbqYjPt88fvpspH7xaDEsi1HQrAegISf5kNE22xlj0QrY7zHSdwS6YycvUqmesYOshS66oRkMmCRu2O46iUai/11kgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(3023799007)(11063799006)(261026121527099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K20wSjBQaGMwSHA0Y2ZOOExjWVUyZm5XK1AyNndZV2FvTGRmdFF1QU1yK2c1?=
 =?utf-8?B?T0hrN3dtbnB4RGU0NG1sVHF0dDViejR2Y29BR3NMa1VUdVdYSHlvbHNtYVNw?=
 =?utf-8?B?L2h0RVptTWloeTBlWTRGU3MrY3BNMVZpcWM1by91TlVMOTlBOUFOK0Q5UzJG?=
 =?utf-8?B?L2lRWENFUjdxUkdnK21EQmJRRjhPQ1V3elJBTDJUZS9saGcrb1hpZ2JZYitL?=
 =?utf-8?B?bUE0S1F3cGlBWFdFcFF0cStsQXQ1cHN4QitBcnVPcWxJTFk4dVdaMGN2MmFI?=
 =?utf-8?B?UC9HeldrcFREOTdUcEJ3UlhNNVVNTytLYlBtWDZ5ZTdTYnYwMm10eE5tbjdp?=
 =?utf-8?B?NWc1Vkx4cFAxSFRtMDhYUmxiYlh3ZXpGZTArT3hLcTlXdHBWYWJXYndhMTRU?=
 =?utf-8?B?STlwUFR4Vk1IWnZDQThlckM0L0xsUmpkSFRJaHFiSSttcCs4dkc0N2h3VXlC?=
 =?utf-8?B?RUllMENhV0NmckVuaW1mdDJvUyttWWlsQ010enVQL3FUY1NUT3JTUXNuS2Vz?=
 =?utf-8?B?VGFOU2xFZ3AyS3ZUUTZvR1k1YlhKNHlBSmVBbWNoQUZZcURXc2xOb08zMjVP?=
 =?utf-8?B?UUtPMDJiVlc4bXQ4YjNZT2pmYUVnclhFSm1GQU1PdTlkaEJ3TU54Mk11WjhT?=
 =?utf-8?B?eVhxSDIwQkNVa1YzWloxZDFFcWtEMWFxMnVTM3AyUU1MV281eDd3dEdiSTFO?=
 =?utf-8?B?Zm83dVVucXhkU0g1bnJ5TnhiQVNnQjNsUjQwYWFXeERETytVZGdLcm52c3NW?=
 =?utf-8?B?YnkvblBydGNxWW8yM2EyS3d1RHFaOXVvMy9QSzdja2RhcHd6SGttVTJjNFI2?=
 =?utf-8?B?eEM2MFB6SENHOVJ5ZEZjMXpFdk1wc2M0eUFQSGpIOE1jSmxpZW84OWVLbzRV?=
 =?utf-8?B?MWFNWjJXRkYwMTNrOW9CT2FNSkNmWS9MSWFiSlJmY1EyZ3cwZGczSEJoKzZy?=
 =?utf-8?B?TmR6Wjh4eUJRMXFCaVJXbHNCQnFLUUJqSUlnaU5DVjkvR0orUkowRy9Ya3V2?=
 =?utf-8?B?Zy8zb3BJU2RFazZCVUNjcUN5dTQ5clhjTmhVQk9DRGVya1F2S3NpdHBUL1Zh?=
 =?utf-8?B?Vk5PNnpuUGNmamV0Vi9Mc2tVVnV6SkQ4bzNZR3E1d3pKb0QwMWIvQUZ4Witz?=
 =?utf-8?B?S3BHWkRxTUYwUkRERElmcGlVN2NzYzlyanF2a3NaZWJvNk1hZ3QvR2duYzJp?=
 =?utf-8?B?aXBsYTV3Z25KUWdnSmtNRzNIOFdqQmU1WndhQWhUWlBBN2ZaOUZFb3AzeVlC?=
 =?utf-8?B?Tlp0UGdMRlRVS1VSM0tST3RzaWpNRU5maEg0RHBDTUlRL09udnVRdXdwRmpz?=
 =?utf-8?B?dDAwbnpZa25VNG94NWt5aytTcWd6NVROTXVFRkRkSEhCQmtaUnRCZlVHbVhj?=
 =?utf-8?B?K3RjTEw2TGhvWjBSYjhMb29rRUhCNldBejdNTFozeWZpRHozcHJOUHprdkhy?=
 =?utf-8?B?aDhtVFkvVXpLMWx4dWdYbWxKVzFEb0UwWEozZUllWU9UdVJNNkYwR09kbzkv?=
 =?utf-8?B?YXpSNXc2U1Z1ekRhSkhreE5ISllvdUhaY0lZTHNEM1JZQjFDcnZqeW1rVnVr?=
 =?utf-8?B?RkpobVk5b25rUkpGQ2VoditlemVjcStxdVo0ZnJoTW53TnJkSkU1Y2dkMXFl?=
 =?utf-8?B?SXREU0x0RFc1S1dMaVNhSitaaGxLNE92TGl3aUU1T05KN2M0SEh2elV2NStu?=
 =?utf-8?B?azRSSUZUUXAzT1ZpNndUNmZuUFhUbDUxVUpFMThTTjAyTlJ0UUZrWTR6eEZ0?=
 =?utf-8?B?eTFsL1JLOFJTSnk4c3ZySUxOaW9FcktEdXNpdWdpSWZVTVgyWFlzQjZYZmov?=
 =?utf-8?B?QlU5aGV1eWMvNGNJU1MwWVhVQmdVeGFSeDhUbUNYcEpuZTdlamgvTFRpQkFB?=
 =?utf-8?B?TU9MRCszaGsyZDRrTTlqN1RTY1NyNEtlcFk3T3IrU3dLaVBVRlh3U3pja0cx?=
 =?utf-8?B?R0U2L1ZZcjZFYUVZUit5VGtUS3JlTTJDTi95WmJBRE5iUWxlVERTK2J1TU5H?=
 =?utf-8?B?YjQ3RDd0QU5wWFhNckhidjN0eHduNExXa1R5NWtzajVJY1o3NkkrM3JOMWxH?=
 =?utf-8?B?L1Urd3NZQW5hUGFsckNHbTQrVm1MbUp0aTdON1doaFFydkhvOGJ1bzYzd05q?=
 =?utf-8?B?ejNzQWRPdnhacGlVUUZJWjJFYVRWRHVFbHRKSm83amNPMnU4cjNwallvT203?=
 =?utf-8?B?aWlEL2Z0aFc5TURSd3JVbENIaGZQY1pKbWNzSUtCKzNPYmxBY1o2NFlkY2xD?=
 =?utf-8?B?QUZxV3lUN3F6ZzhzMWlQQ0VvTTVPc3ZsVTdxOXBZdnI4STd6TG5SQTUwdFVB?=
 =?utf-8?B?eDliU0hTd0ZTYU42b2FVeUtFc05SR2JaQXU3bThnTndoRnE4dUNhZk1aRGJG?=
 =?utf-8?Q?7F6sSbGEz16tjKW9cwKE8gj+kI8lMSn78eMk73sJXWwj0?=
X-MS-Exchange-AntiSpam-MessageData-1: 08NfRTLXwJe+tA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee079376-92cc-45ce-43ab-08df3cb45432
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:51.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7PzWNIF763YKnmZGt+UPsm/nlrTbGrdYbdPN+beFL2yVADhr8vlRvv5N5+mHY+QTis9i6lJqfFY65O1qohMAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

Add a tag flag to `FalconMem::Dmem` and set DMATRFCMD's DMTAG bit from
it.

Similarly to IMEM, when tagging is requested the DMA engine tags each
DMEM block it writes with the block's source offset, which the loaded
image then uses as its DMEM virtual address. The r000 load-and-execute
HS binary event will provide a DMEM virtual address for images that
need one.

No functional change intended.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 23 +++++++++++++++--------
 drivers/gpu/nova-core/regs.rs   |  6 ++++--
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 3b3e8e0f821a..00da664887fc 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -135,8 +135,9 @@ pub(crate) enum FalconMem {
     /// Non-Secure Instruction Memory.
     #[expect(unused)]
     ImemNonSecure,
-    /// Data Memory.
-    Dmem,
+    /// Data Memory. If `tag` is set, a transfer into DMEM also tags each block with its source
+    /// offset, which is then the DMEM virtual address of the image.
+    Dmem { tag: bool },
 }
 
 bounded_enum! {
@@ -559,13 +560,15 @@ fn dma_wr(
         // need to perform.
         let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
 
-        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
-        // code addresses in the firmware (and the boot vector) are virtual.
+        // For IMEM and tagged DMEM, we want to use the start offset as a virtual address tag for
+        // each page, since addresses in the firmware (and the boot vector) are virtual.
         //
-        // For DMEM, the start offset is folded into the DMA base.
+        // For untagged DMEM, the start offset is folded into the DMA base.
         let (fb_offset, base_offset) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0),
-            FalconMem::Dmem => (0, usize::from_safe_cast(load_offsets.src_start)),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem::Dmem { tag: true } => {
+                (load_offsets.src_start, 0)
+            }
+            FalconMem::Dmem { tag: false } => (0, usize::from_safe_cast(load_offsets.src_start)),
         };
 
         let dma_base = {
@@ -659,7 +662,11 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
             });
 
         self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
-        self.dma_wr(&dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
+        self.dma_wr(
+            &dma_obj,
+            FalconMem::Dmem { tag: false },
+            fw.dmem_load_params(),
+        )?;
 
         self.hal.program_brom(self, &fw.brom_params());
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index af0bbb92e992..7e997478ab42 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -321,9 +321,11 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 }
 
 impl NV_PFALCON_FALCON_DMATRFCMD {
-    /// Programs the `imem` and `sec` fields for the given FalconMem
+    /// Programs the `imem`, `sec` and `set_dmtag` fields for the given FalconMem
     pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
-        let this = self.with_imem(mem != FalconMem::Dmem);
+        let this = self
+            .with_imem(!matches!(mem, FalconMem::Dmem { .. }))
+            .with_set_dmtag(matches!(mem, FalconMem::Dmem { tag: true }));
 
         match mem {
             FalconMem::ImemSecure => this.with_const_sec::<1>(),

-- 
2.56.0

