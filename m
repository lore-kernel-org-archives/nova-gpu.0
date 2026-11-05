Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883553;
	b=cYY0qU0HzkkCylMW3Il1YX4AwMPbYx7q1KWeFOks4F+CfoUUnJvjWgp71LHaevygoEcP
	 eUygK6+Jet42uU6UcB2CsrJRNJa65b7afc8fHiBbAFIIecPxDCdBEsLtCUYATmTAoL1Ka
	 j2UcQNGcy42z/7ByFB1nazUWJNNq0yj3Iz4qyH6EVqlSLaMCCLBz3gC52sji1eS5mReMu
	 trTGqB9TqUR8R86MGUun0kk1k1o45in2SduYOxLdVpnLAQ74y/PzGVIKtv8gKRI/5jaOr
	 jyYirMjrlSKmMPxyVh8N+W7RTFuCchQQpSCi+0Cyn8J+oXYPUp/R2MuNqSeeF1o2e6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883553;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=JQGG9JnbAkhHdMIK61L7sRW2UJvBsGTOnaJEjdxu3tA=;
	b=VvytyDareswgDa1X5Ca8GNmRDhXTjd7wsD5AiBw3jPwemziJy+Rj8SacoOC1b4MTxt7C
	 TnyCMmsuQ8moFgNftDWd60LWtKo4fVQi4eh8u7m2xzT27gGlgashcxEHBcrV31wMNKurl
	 3uiLRuqMWMu1KdQ6w9oNuRM2zjT4S5eJvggc4VxjDrbijVCve/dsHR9vzpvZl/uw+NSU9
	 ltksbOQpVQ6btB0/GuvPhjm+VhEGTP7xC7TGYMXw9ylGA1w7XTFMVb1albaddyLIoUW8W
	 9eL483fYG2Cf/NybZUkosFEFhtNTAyuudRNSygB8isDW5izd/zKAoTF6+SI+lhYcb3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hDKp300o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.7
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3974606A32C
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 12:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3974606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hDKp300o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3mU1HKnphU0qbx+1+/QFRgtXBx8WILYjhuOpl1KHcgXlEcRSlFPg7pn5JNIb8GhW3c7GpWCRBmUT9o653h8Mfe4FQqIITqIDJKjXYVdsd1p4Hsgfuk59a8tjO/sfIRU1cK429zr9IPcaiKgoWTPpvmkEaQrppxmV5+2eqPtsDnyHwxXb3V+IpobpjQbVPIO34QITjKow130McrHXgIOVkuMPXfb+fdDjd9eeNnCxDNLNgSLwqY2qOPtVoWa0f2urNBemrTzX4LsVcUUBe6t0azeuKDNWm/+l4xYVKgNtqkZD9spI4DBaYGfW68bLpMFCYbxMg3tu87KZDTMAgZ35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQGG9JnbAkhHdMIK61L7sRW2UJvBsGTOnaJEjdxu3tA=;
 b=FHSQn7SWArNsGubDcTbQIR5VFK+9WzfKN/KFz56F/0IpOmPhRyrejLk4A82H5jZjW9DZeZx6MDnP4UH9BvyjFqqblkCQF0WsqriximnVcjz0uoPnQ6+WCJCxMmfTU3/xSMqci3fNK3vDxfWbMjYYvy0oIqNAh6LlSraTdADoCLUe2VDFd3toRM462QJ9bWWaTrLu/GuYbrtcjN9tOfdRg+Y9nz26//UGY9rqZsm1XDO/pK7wQpgm9chY53wJXGiv5yjAsEUOqJJrcQ7YCOhDnq7phoXs8D9tyKRUKpQsn4XkqBZHzqrezatGlDjtj+2ZSDy8RebStKrkQaMRDWejKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQGG9JnbAkhHdMIK61L7sRW2UJvBsGTOnaJEjdxu3tA=;
 b=hDKp300oYIPUby5hufJRvp/Cus32/6Ly6usTBryAVUQXFl4LWoFCRSY/lg2xLqzA+zUttQYE7UhaoriSL4zDgi4Yd5Neic8KDA8la8M4+LfpK6/y6DO82yS/iuBLcnjkXAK+COtTfVSKFPyEdESYDBozzpwAD/VNJQE3+l/jDxiVm/hD4bH8UA+Vm/P0L9q9iHSNONMsxjy0R2CKc3FFW01TfeRjiqDTRqTs/tR3/f7/YYaPQ7ywNFS3VRe6yKu3rBfKr53+JpI/VagRKdoUPBYG2+8Gg7pKgcPIAV7h7CO57ah2J05NAGTxI+NZBPaRpMPMEMnBM/p8PzMWOE+n3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 IA0PR12MB8893.namprd12.prod.outlook.com (2603:10b6:208:484::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 12:59:08 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:59:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 21:59:04 +0900
Message-Id: <DMNAN7KX22SC.QQ5HURCU332A@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] gpu: nova-core: place the generic bootloader at the
 top of IMEM
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-2-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-2-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: TY6P286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::13) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|IA0PR12MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb3f2e9-ba3b-458d-44bc-08df3b3c9426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|376014|366016|261028144727099003|261021121427099003|261022115727099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261102123227099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YUeHLLiDLOpOReVecgdUqkHPPCQsirbZPP6C88SsswACTc7/HzRrRnLuouBckZbWJghdkbl6+c5hhL2WVw53o68qahKW121rrDD5VeefMlffwmKoYUaHDRhfJT08cHJahyDCV5yLv1dHEgNqekgmSq7PM08h284BrcCIQ5/JlO1NOg7DRL7APtfmSeEKKqtYKQa6Vd/cf3M/NxVJwevPdWJJ39nH3Sat/rX7JlCV/YrGK+ubdWkXJifQDcxPXtuxHhLOFNhRiE3PbQCtsHgSpZItbP+5iaRzHH2Gc7LJ07qaaKpU1/Zy79zg86llq8eu/HtdAS1RnfRGjoVZLtfEhwiw4AyeQoMckNTSENnmF2FVhJSfl1tsCo+mEdgAmAS85Qn7hXDzMRpAQ22L/rIg4yXObM+OZaZABMGJra/aWc5gJJuhwBbV+gAl9bogrwNGfWj+11wwJH7u4/SkuOGW71OH0fxGmIeRy0/Tyrstq0X2E4t7WFtZv7rI6p2Uv9RTkySlZYTMGLNJNsvNiK5sD89avEkw/3pZq/sIeY7kdEiQhPQBXKw5ipsTpATtddIb7HDOqA7SlL9HmLkhxVx1jKmq8GPV5+3hlVESCn9YDSHnhmeXIY1k1WNnqFyX2Jsce8AfWLWfpBFMLApwyx3byr/5xThTVmjOuFxpDk9sIjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(261028144727099003)(261021121427099003)(261022115727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVRZ1hrWXJGZzZwd1liaXdpcW1CbW15UzVSUDFPQk94bk9HN1VUNG1aelVQ?=
 =?utf-8?B?YVBPdFZNTDFSYzdoMVVGcXAwS2RBUWt4dkg0eWlPYVVXS0dMcDV0V2RwcE5p?=
 =?utf-8?B?aGR0U2YyUmFXWFkrMUF0Rnk2YldVWkdxWWx1RUM0WTQyNTJqUk9VWjh3UmxD?=
 =?utf-8?B?NDBYYjZVT2tMOHk1QjBCWHFWbVBZaXdqMEd6b2NFUzdFc3JnbVpheE12NVNE?=
 =?utf-8?B?TzlvTWhpZ09heG1CcUdjcTZkUUMvRTVJN3V0NU9WL1plRkU5NWlhK2NRK1VX?=
 =?utf-8?B?ZmYxSTdsZkREYXIzQnhyZnlqa2hlTnhkWmtqMS9tQVpYUXFjcm9lMzVJUEw4?=
 =?utf-8?B?R1grM2NzV1R5bTVSK0drWmxVYkZHckRzaU9RMWtXLzZjbnJQVS9KS2VEY25l?=
 =?utf-8?B?SS9lUHNNUmltTGh4SytuU1o1dXcwaFlKblRudkN1OEgweGlMcTljRmNUTlp5?=
 =?utf-8?B?ekFQaUxKSnFlQVh1T1FkNS9tZW55N3R0MUhOTDhrV2Zpb3BjUTVhUzRmaHZT?=
 =?utf-8?B?a2kvT2lpa0d0TFBRS3dFS3pIN0FKendzQUtPc2lDdWF2Rlo1QlZ5SHlzZ3BL?=
 =?utf-8?B?M29rZVFQVDJLRmxsditXQ2tpUW1GZTByYTZRMUV3TkRRTjF6L2VnV2lyWjls?=
 =?utf-8?B?UXlQVDNHOGVlbFpEdGVPV2V4OUFXTzc3NVRGZXYwUzdDN05sU1QxZnZPeStz?=
 =?utf-8?B?L0xrR0NvVGdkUklWVEJwRVBVQ1RJR0tEVllIcUx5OEtycUV6aC9TckZ4LzlX?=
 =?utf-8?B?Y3UrNktXUnl0ZFdRUlR4OEVVUy9obkxNVFJEN3hNeUpySDc0TjVMV2hyRXls?=
 =?utf-8?B?TU5WZjZMVXFPYVJEM1pUMUJpNEV3RlR3QkEwMkdNdkJzOGYvZHd3b1NvTHhx?=
 =?utf-8?B?TkR1bmtvMU96ckd5YzQ5c2ZxdFFvb1dPR0wzZFVZckoycVRyUTNwSU5YakhI?=
 =?utf-8?B?bkZIbWgySWQrd1pjWnhNM0UzemdIMDk1NWpBYjA3ak5lV0lVb3Q1MTgvZ25s?=
 =?utf-8?B?emZ3VzF1aEpCSGQ5V0QxMmVURzJNV0U2Smd4dGJlOE9sT1IwODh5TDFyV1F0?=
 =?utf-8?B?N1hzRU9ZTDNXTjBvWnFrT2dQLytFbS95MzZUUWhmUmdPWlhUNkY0UEZYbTJk?=
 =?utf-8?B?amZPbDJob2NrWW9sVzM5Vm0yV2RqOS9jMFByamVpbjZNYnpPTk04K1p0Y29n?=
 =?utf-8?B?clpKZXJCME9RczlUOXRCb0VuMGpoZk1XMW1CSGZab0FHekt0YkNtVlFKZFR4?=
 =?utf-8?B?ZTdGcmFvZU5tL3BzckVPM1lENW10NkxqWlI4eU9FQmVpNUlMYk5GV2VvMXpv?=
 =?utf-8?B?cHhMeW9xMEdZY2YzSFU3M1RPeFBLWWc2UGMzdUl2WEpPKzBuR0cvNFIxc24z?=
 =?utf-8?B?Smlla3NadWdXSjNlK2x0MVZWd3hUcXRreU5DekVkUGlXeHROZlRtTXlOUW9k?=
 =?utf-8?B?WDNtRlR3YjBBNkpQZVYzSStGTldLMDNQbXlMZ1RzbUQxQjIyWTNVZnZsVXZv?=
 =?utf-8?B?Q0EzRHVKRndtNU92Z1RCUjRIeSs2KzdyRjNrZkdOenpuVzArei95Y084MUkw?=
 =?utf-8?B?OEI2aUZUdkk4bU0raWZ2NlVmRzhQQ1FwNW5FZ1l4bjN1bzd0cHc5UmRnNGlO?=
 =?utf-8?B?N3lUNG1iZCsvZXlyRHc2a1JUcGdEeTdvSnJsOHIwbTUxK3l3VjFnZ0pvOW4w?=
 =?utf-8?B?Ni8rTlYxK2tCbFJSZFMrdXhhV0Vkay9yZUtESWR5c3NUTjBseUxkUWc4NnBn?=
 =?utf-8?B?RDBwUUk2V0ttZFR5eUNydkwyL25seUZjaWI3M2VzaUNvUWpDLzRhd1FWMG9N?=
 =?utf-8?B?T2pMTURvWU5vUm5wblkzelIvd3NYb3lyZjczeFRsZ3o5VWYxclIvV3l4OEM0?=
 =?utf-8?B?T3lYeldORm9BSEgyczI0emhLQjhVQ3pjaHNML3g0TW84YmVFWDc4QnE2alBC?=
 =?utf-8?B?SXpCQldiZUVxQm5FL0dOaDRIRW0wTkpiL1dRRXAvNmM1NHErQmVPdWNZTDRp?=
 =?utf-8?B?L3lJejBnQTkxdHVVU055ZDh0cTlabWY3ZlMrajdsckZiZEEzTFhNRk85YW5j?=
 =?utf-8?B?MXVZUmI5eVBHV2NmMEJQc3dDeE1LYWdTR09MNE9kU2ZTRkRYY0FYWGdGT0NE?=
 =?utf-8?B?NkJ6VENoamswOHhUb1VBVHJGdUNIWkFaNUx0K2x0N2JSa25yZTdsZDM4d2p6?=
 =?utf-8?B?cG03b0JkNVhYVUFkNlFZZW40Um82ckd1ZzJFdXZRdGhndTVPaEVxTzFvQTJq?=
 =?utf-8?B?OWpmd0JDLzEvb0VlNS9kWnRkeTQwaWkzSEZ1R1BYSTVJcFk0UlB2Qy9PZU9P?=
 =?utf-8?B?NUV5MWRab1IwcS85U3kxQWtraWxITi9ST3Y4ZWJMUWdHTXhrcjVJOXBJNDFP?=
 =?utf-8?Q?wzW3vVS5f57UnfPf+xl+EXpX6UkshnNvHXhPbyiYZejx1?=
X-MS-Exchange-AntiSpam-MessageData-1: GuOdh3/vv/Vo8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb3f2e9-ba3b-458d-44bc-08df3b3c9426
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:59:08.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV6M32gsUtNhHRn6b0L2UtYCs+EFFn+2VhzoYCKNULCrmZHUzg0wNnqv57iEzKchuCFDhOm8M33GOOytvp7Qmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8893

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The generic bootloader was loaded right below the first 64 KiB of IMEM,
> on the assumption that every falcon it runs on has a 64 KiB IMEM. The
> r000 load-and-execute bootloader event can name any image for it to
> load, and the bootloader must then sit above the blocks that the image
> occupies, that is, in the last blocks of IMEM, regardless of its size.
>
> Place the bootloader at the top of the falcon's IMEM, using the IMEM
> size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> [acourbot: split out of the patch separating the bootloader from FWSEC;
>  convert the IMEM size with usize::from()]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs                    |  7 +++++++
>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  3 ++-
>  drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 23 +++++++++++++---=
------
>  drivers/gpu/nova-core/gsp/hal/tu102.rs             |  6 ++++--
>  drivers/gpu/nova-core/regs.rs                      |  5 +++++
>  5 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 0b377bd6524a..1bceb38c33c6 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -382,6 +382,13 @@ pub(crate) fn new(
>          })
>      }
> =20
> +    /// Returns the size of this falcon's IMEM in bytes.
> +    pub(crate) fn imem_size(&self) -> usize {
> +        let blocks =3D usize::from(self.pfalcon.read(regs::NV_PFALCON_FA=
LCON_HWCFG).imem_size());
> +
> +        blocks * MEM_BLOCK_ALIGNMENT
> +    }
> +
>      /// Resets DMA-related registers.
>      pub(crate) fn dma_reset(&self) {
>          self.pfalcon.update(regs::NV_PFALCON_FBIF_CTL, |v| {
> diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers=
/gpu/nova-core/firmware/fwsec/bootloader.rs
> index 59f57714fcfb..3943948d74bc 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
> @@ -108,8 +108,9 @@ pub(crate) fn new(

nit: docs on `GenericBootloader::new` and `FwsecFirmwareWithBl::new`
need updating
> -    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chip=
set) -> Result<Self> {
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        falcon: &Falcon<'_, Gsp>,
> +    ) -> Result<Self> {
>          let fw =3D request_tlv(dev, chipset, "gen_bootloader")?;
>          let tlv =3D Tlv::new(fw.data())?;
>          dev_dbg!(
> @@ -68,9 +73,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, =
chipset: Chipset) -> Resu
>              ucode
>          };
> =20
> -        // The bootloader's code must be loaded in the area right below =
the first 64K of IMEM.
> -        const BOOTLOADER_LOAD_CEILING: usize =3D sizes::SZ_64K;
> -        let imem_dst_start =3D BOOTLOADER_LOAD_CEILING
> +        // The top of IMEM, above the blocks that the bootloader loads t=
he image into.
> +        let imem_dst_start =3D falcon
> +            .imem_size()
>              .checked_sub(ucode.len())
>              .ok_or(EOVERFLOW)?;

`imem_size` is 8:0 (so 9 bits), and multiplied by 256. So it can be max
~2^17. Then we subtract off ucode.len() and do u16::try_from, so that
could fail. I don't know if any real hardware actually hits this though.
This value (`imem_dst_start`) eventually gets written into
NV_PFALCON_FALCON_IMEMC::offs which is 15:0 in nova. According to openrm
though, it's 15:0 for turing, and after that it's 23:0. So maybe worth
checking (then we'd widen `imem_dst_start` etc to u32). I think it
probably 'just works' fine to switch to u32 and change
NV_PFALCON_FALCON_IMEMC::offs to 23:0, even for turing, and would be the
same behaviour as nouveau afaict.
