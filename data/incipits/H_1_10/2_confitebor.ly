\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r16 d' h' a g8 fis r16 d h' a g8 fis
    g d16 h' a8 g fis16 h, dis fis h8. h16
    a8 a a4 a r
    e8 fis g fis16 e d8 d r4
    r8 h' a g fis g4 fis8
    g4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r16 h' d c h8 a r16 h d c h8 a
    h h dis e \hA dis h r16 e, g h
    e8 d4 cis8 d4 a8 h
    c d e d16 c h8 h a g
    d'2~ d8 h a4
    h r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4.^\tutti d8 d d d d
    d8. d16 dis8 e \hA dis dis e4~
    e8 d d[ cis] d4 a8 h
    c d e d16[ c] h8 h16 h a8 g
    d'2~ d8 d d4
    d d2^\solo d,8[ c']
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to cor --
  de me -- o, in con --
  si -- li -- o iu -- sto -- rum, et con -- gre --
  ga -- ti -- o --
  ne. Ma -- gna
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti fis8 g g g fis
    g8. g16 a8 g fis fis g4~
    g8 fis e4 fis8 fis4 g8
    a8. a16 g8 a g g r4
    r8 h a g fis g g[ fis]
    g4 r r2
  }
}

AltoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to cor --
  de me -- o, in con --
  si -- li -- o iu -- sto -- rum,
  et con -- gre -- ga -- ti -- o --
  ne.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    h4.^\tutti a8 h h d a
    h8. h16 a8 h h4. h8
    a a a4 a r
    e'8 fis g fis16[ e] d4. e8
    fis d16 d d8 h a h a4
    h r r2
  }
}

TenoreLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de me -- o,
  in con -- si -- li -- o iu --
  sto -- rum, et con -- gre -- ga -- ti -- o --
  ne.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti d8 g g, h d
    g8. g16 fis8 e h' h g e
    cis d a4 d c'8 h
    a g16[ fis] e8 fis g g, r4
    r8 g' fis e d g d4
    g, r r2
  }
}

BassoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to cor -- de
  me -- o, me -- o, in con --
  si -- li -- o iu -- sto -- rum,
  et con -- gre -- ga -- ti -- o --
  ne.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'8-\tutti g, h d g g, h d
    g, g' fis e h h' g e
    cis d a' a, d d' c? h
    a g16 fis e8 fis g, g' fis e
    d g fis e d g d d,
    g g'-\solo fis e d c h a
  }
}

BassFigures = \figuremode {
  r1
  r4 <6\\> <_+>2
  <6 5>4 <4>8 <_+>4. <\t>8 <6>
  r1
  r2. <4>8 <_+>
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
