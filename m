Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701393;
	b=3bvN3iCws9pWzbKGBWriaf+seaDgKKOthS92O+htih+oOvYy0eTBPQ1JA3yQk7hpLXky
	 Vi1L4TCXO+cn4YkLJTLIkiSPIb9w09Aj8pZ9FLz9wJHlHFJf0MhVqHJDIjWNknkiLX5jI
	 qTT5GWaiub+pLW/7Uj8zjSIrVoTjjGKlM3vXNUBEZ1MOuslKGQBs2uJ/E/x9J3vUiGrQ/
	 dC2z82NIJ7e7FyTZfPwf4yLfcj+RJd4pfqIbPvgH+iUa+M4SBICWgZ058E53lJx3DsryF
	 5gjsU0STQ+N1MKnqDmVublrV0JDqP7dzueR9nyZpuCCMLWzmOZW4EAdQZwKFlHgeO/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701393;
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
	bh=aaDnAr6w7aAnquu/PbS3fqYj5MgcHgPn8J8ydYeWfWo=;
	b=0nF4kuWN8XyFXk146/tsxPixxc6BTTS2oV68gdsUm/c4I19eVv4yNGVi+QNPMsBEHPRJ
	 FaFoQsQlKNFKwuSILgZVDPRB4eeMLVK1ic1XBMqqtajCIZZlycBo7Y37+OV4OOqNrB6GM
	 cz9Czl0dTfipf9/+Y4EeQR1eWV3VYHD+fr+riC/MLKunM1KvoAXfFQcrX3pInoDsukBn/
	 s3LlADaJsicFW6gjzCNYznU1+jICYakX7E7MVd2qozMBB2NslYRPMRX1fzrtZ5szrNmkf
	 PnmjfoGsoFaCo6GKHzKV/zbYgAxIjdqO/l/gGPkuAGgy94nHQFgKZ9XBBh9ACmQ7CFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uGxTNPu+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E1860A3821
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E1860A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uGxTNPu+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvuyrMLuVx5BDFklxpYzQ2V8sG9vfEitnRKG5joG3tOdlFmE12VGaUK/bBgKKZSfrGqrGZ4ZJGiVeauhe6fuIs6pMpnOmBC59pzDlOn1+Y++kT6LFCzrxSCNPKLFqlgTyvr6IwmnsvTWLziNQYIitbO1t7x1ijEvzKqWIrSGGqjicLzvU43Uo2yYitZp+stdnnNe+MN8P6bN8tpgZLopQ2se0UTfcyl/1v8ZDNC4b0qvxBAyOg4zzQgdYPgcYc5BQzeLjHF2zxV1ltQPhCogvnZMsc5sIMLpJBYcGlr/Z1DficgNmeOZnspg5lCEDVpZAyDSjB+LefHR1bKZQAXpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaDnAr6w7aAnquu/PbS3fqYj5MgcHgPn8J8ydYeWfWo=;
 b=pupIRJahHZ1Rjo/Ooi8q7mI/GeeKlMVwzNm24SxI0LtyE6VZak6pXiNuuKxE8j4uyOzaQDhM3rZAdZHRDpcNLS+m4qhMlsAKY7oTHhdEooZurf+PeLDTQXlmriNuYfEIK4r9gsn/4+UCEuc1lhpECs4I6Dcu48ArjFm0a7kt6jnOpDXUyphldRlTPp2znGHVIQXSt7WubfEcvMI4fbBs131IVe1Xxnlp80eUkv+NuuKf33FxE5BF1pSrKkk/lxsrRJulM1TWwRLevAhQ1jdHWzXrWriRoyneZgWZT4dGkhcoAvLm+VDsPywuoq5ulAo/X4ZlmNauy5NjHj0OE4QNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaDnAr6w7aAnquu/PbS3fqYj5MgcHgPn8J8ydYeWfWo=;
 b=uGxTNPu+gNpLy7vRJvqRPit8GVXtgrUFyT+QgZ9j0dUNgS1Gz8W4Sjpc9O+besmMNsYpbE+SYRiOZEfnYG3fYtR+mwCIsWEfAlwztUqTCHeQjSOITyp+mhwhxN4e5IhkFgHWBdIly7KBUyJsWnfPbghf5j0bTfnZKxgmkfBSBPXLqNp/FcBA02SUIfp/zKtHPfleffVNlWVFKtMYs0LvMWjJk4IsDZANT0FYPZWAYi6Fx+uNe+Fv6hrEjDEO5xDtsxSVsFSOz6F69M7ezJHKhTotbj+emD+ah0XaY8la+t5tZGXWmpx8d8l7c06iJC2+s8Y7DiEg6kEbu0fLQ+8VZw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 10:23:09 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:23:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:45 +0900
Subject: [PATCH 7/7] gpu: nova-core: falcon: check the per-block DMA
 offsets for overflow
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-7-e3d38fc130e3@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e29c72-3738-47f3-06d7-08df399474ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|11063799006|56012099006|261009223027099003|261021121427099003|261028144727099003|261022105027099003|261021135927099003|261021123027099003|261102123227099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d1SHO+97EgTygd3L8Y10HQw7l/axyskpaHe4C7AUPG51yB4ue8SnWcuVgFc+C4AZ87hqn+vAXRvm+1z/RKbFLQ2FOD08SRIIVzmRjzexfiBXzqIzEVRFPMY5r81/dQpg86Ly8FSlRh1RXTj4YbetU+WpMkwRyR/Ev/4+OMO2EPbsr9XxBJCMkw70DBQqoAVJsoME4TROkzMv+YOLNCRr1vfaaAOBh0ixoHurnadCKLaZn+QM3tRR6ehe346+EPO/bym8T82PmMN8HbOZp37trt2BY4o8G0PNxxZjEiDrs6XEqFgwVcRuQ+4fmTE4v+U8kbeA3gtNU6dDIT94Ee8T2DbJKahN0yuhnejbMjS+p/iQ0isFnloMfx0kfV148sSmlFxF67hNaZykStLFAw222Gx2Bp1oJ0f4/dLgACORqUrdFpCBI1+VUN02qqTxXCbG2qZ7ycgd9Ubr0UpfldPou7jy/6HeHAyUiTGR40I7Yf5c5j+shk2ETOlRPIZ0XdSOLIenH9ngcVuiaVoFjm4C1mH6WATolQYetRsuk66BGNcfqinXZhSIN+3x3dE6zVxYa5fyPJbylDXuckc4/aJytdH3OqI0NSocXNy3fLWzrkDEA3IRQuIW8dseEv99C9gUB7V1V90i3GSeFdTFnCtkk3ECa7qK5v6UnUrids8k5Yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261021135927099003)(261021123027099003)(261102123227099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlA2S3VrbDhoTjBGaVdPNi95RlpLYkQ1eTcrMkNVeVQzMERRc2VjSjJBbE1H?=
 =?utf-8?B?emRIVVZyeG1qZ1llZldNUW0zVkxFTGgyZzk3L0d2cW9NeXNEZFNxMUpuYnh6?=
 =?utf-8?B?bFRiekg4eWdjbWtGRUpYWWFyNDF5OHhkTnhPYmVab1NrVGJOUjNRUllZRnZC?=
 =?utf-8?B?RXpsckNwUlN0bkMreDFVcmJFTjN1RWhEcFRJRnltNFUwbnFPQ0x4TzkxbmJa?=
 =?utf-8?B?eXRySGRyRVJWRWlDaFpVWVNkU280OHF0c2hOMDduaDRNSWl5Y0Q4TzloTXFD?=
 =?utf-8?B?L293TElEc0N1RFo1OGlPZEFySUtBWHJYUDE1NVZ5NFVkKzBTTTJQSnM3eGRB?=
 =?utf-8?B?Zkx6RzlyMG9JUGVxc1NnMzFOaVdiOFh5aHFITWM1bzBYcEJGV2NGRkRIRWtx?=
 =?utf-8?B?YjhvdG9xU1VzSnBHYlNIWWJBTHBRNExQc25wekYvNWZNMVRCSWhJNWFuT3NM?=
 =?utf-8?B?MFpVM3R4ajg1SVJuZGZZa1B2ME01MzZUYXdna3Z1dy9nSXJQZ29hTW9aTEFH?=
 =?utf-8?B?RmFyNG9PSlZEMDFLd2c2WEJ3YUFQL3pzWlVKcGhRcjFRV0VORlMyaEYrTDZX?=
 =?utf-8?B?Z3ZIWm9aQjB3UGg1YlcxaTNyQXYzUm9LcnAzcWNWd2o1eFRFRHh1VHJ0MmNl?=
 =?utf-8?B?TGFHY1pNS0dSMVg5NUw2Ty9JMDVYWFVWS05xa0hVS09BZ3ZvSjF3QjZnMGRr?=
 =?utf-8?B?YkhiZzM1TlQvcnkvZCs1clg1cHpjM2xuRTB2ajdUcUZnKzdqbk9iUDQyZGxE?=
 =?utf-8?B?TVdSRjcxNWJVblZqanFZejg0aXFuUERXSlFtUkh4amtLMVNkTHJ5SVp0dlVx?=
 =?utf-8?B?VzMrRVZDMkxmejJwZHdPR3JiU2xWUmw4Mm5FWnBhS3BEYndwa1l2M1J0cFhE?=
 =?utf-8?B?a0orN2pVVGhVUnJucko0aUpqODlob0xDWXJZdEFmR2hUZmt2VG9QTy8zT2kv?=
 =?utf-8?B?VzFaVVdOZFRLMmR2dlFJd1hMTnVxdG5mVkNEckk4aTJ2OTVRa3U4ekh6Snp3?=
 =?utf-8?B?d1pJWFR1U0RWWldxRjE2M2gyNXM2dFNBUGhrN2hxd1p1Y2V5d3Y3Q3RWcllz?=
 =?utf-8?B?Q0R3LzJtRkY4RmlnQVZzeVNvbXdJSUxGbGlLdGw1dExwTFhvdXFVeURYNklq?=
 =?utf-8?B?NzVZTHhRam5xVktnTXVReHJLYnZUQjRzRU9FU0JocSs5RTdzbmQyRTFPVko1?=
 =?utf-8?B?Y0dVS2xPaUt3YU5PQnlIN1pPOFB1THJ2UFc1OEFUQTl1eDJRMjU0WUFTTWxT?=
 =?utf-8?B?cjVOU0Z4aW5wZmdLVU9CUEorTzJTamdPQnNuckw5WlgzTkhBdmYrZDI4MXl1?=
 =?utf-8?B?RnFFMytwSkw2clI1QzdKZVNDbGZhSUY5WXF0S1ZqaFQ3dWhTVHlvVE0xNHA4?=
 =?utf-8?B?SGFGNENGRDlWOVMxcFZSSWFsZmY2OW1GenJyZytvYzRhUDI4RzRHdDVFVitP?=
 =?utf-8?B?VHRtbTRHcXExS2JWdmRXVmRiZnBYRmJpeXBXN1hKVnArdmJLTDczMHpLcTM5?=
 =?utf-8?B?eDBBWmx6OVhXVFBIOHJNcERlVjhsRk5UMnZqempNdWFQeDJxNUxiVEh5ZWU3?=
 =?utf-8?B?SWpabTVnQTBZOUxjR1p1cURQTWFQamM2MFZyaUZKQktYMUM2UzRTY1picjVz?=
 =?utf-8?B?d0NpRFo3cU1SNG9jRjZid1pGSGtBYnhsMW9QRDhWVXc0YUlCWVIrWU5XU05K?=
 =?utf-8?B?dHh5TFFjZ1NOa25KWjBEZ3F3VFltSERUQWoxWUZOOE92amhIK2JZb0l0cHRL?=
 =?utf-8?B?WVljSFR1VDY2eUltaXdZcm0xemRPL2VVa2MreEFKOTFhYURCMFZzeFhxYVBu?=
 =?utf-8?B?Z1V0M2Q2QXdldmNuV1UwQ1JnRFgzTnNBM0gvYlI3UU1ldjhmRGNGWVRJaGZl?=
 =?utf-8?B?WGtGd1J1QzNuR0wzY0RzWmROOVBZU1ArR2xWWmx6VXVkVmJkYjF4dEV1TVFD?=
 =?utf-8?B?UHI1L0tBOTNhQk5WdnpqSnVzWEpJTmdvaXdRVTNVbFY0UGVibEVWeGVTc3BL?=
 =?utf-8?B?emVBRmRuRUowUWlhYjVlb3c3cWtQUjhHaFVzSU9XekMybFROOWxwS2FoUGhM?=
 =?utf-8?B?Q0o0MnhUMVVrN3liN29LVGlCMndYUmxIcGk1VG1aa3NPTzl0bTEwc0JxOW43?=
 =?utf-8?B?RUlBQmk0UGgvTVVYaEZlQVNqOW1wMnlyWTNrNWd2WXlvOEZpSWtpSUNxSnNq?=
 =?utf-8?B?WjgxeHNoM1VEbitsaS95c2Z6czdNa1JDeWJEMWp1ekhJVlRUSUN5bE9CMjUz?=
 =?utf-8?B?WFR6aVRDWjJKM1ZqNmIra05vaXZBMzZNOFp0azVNd1dBWkJvRWE0ZnBHV2dH?=
 =?utf-8?B?YUlRS013dDUxMWtqWmQxMFR6R0FSaXNQZWtzd0UrVHRHdnA2endYK21vWjlE?=
 =?utf-8?Q?/sX27ika7mQ1l/XzbNyRYqJxZDFZHTzORjwfNzwbaLadE?=
X-MS-Exchange-AntiSpam-MessageData-1: lDJaKzfhUxmGmw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e29c72-3738-47f3-06d7-08df399474ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:23:08.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WA4hlWu6xfy5Q3sgqAg4Z9cNFvxTBkLMk2/zWSnZUa+ET3vQw4I+8rpeWjVZviZRIMwZ63E0xa7WRisWTIVUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149

From: John Hubbard <jhubbard@nvidia.com>

Each block of a falcon DMA transfer is addressed by the start offset of
the transfer plus the block's position. The two additions were plain, so
a source or destination offset near the top of the 32-bit range would
have wrapped or panicked rather than failing the transfer.

Add the two with checked arithmetic and fail the transfer with EOVERFLOW
when a sum does not fit.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
[acourbot: split out of the DMA helper patch of v3.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fb43d0ed2821..c54875e55da5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -599,10 +599,11 @@ fn dma_wr(
             // Perform a transfer of size `DMA_LEN`.
             self.pfalcon.write_reg(
                 regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
-                    .try_with_offs(load_offsets.dst_start + pos)?,
+                    .try_with_offs(load_offsets.dst_start.checked_add(pos).ok_or(EOVERFLOW)?)?,
             );
             self.pfalcon.write_reg(
-                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_start + pos),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
+                    .with_offs(src_start.checked_add(pos).ok_or(EOVERFLOW)?),
             );
 
             self.pfalcon.write_reg(cmd);

-- 
2.56.0

