\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante"
    g'8\f h16 a h8 d16 c d8 fis
    g16 d h a h8 d16 c d8 fis
    g16 d h a h8 h e d
    cis cis16 h \hA cis a \hA cis e a8 fis
    g16 a h a g8 g16 fis e fis g a
    h8 a g8. a16 fis4\trill
    e8 h g' g16 fis e8 d!16 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante"
    h8\f d4 g16 a h8 a
    h d,4 g16 a h8 a
    h d, g16 g, g'4 fis8
    e4 r8 e' dis dis16 cis
    h8[ e, g h] e8. fis16
    g8 e4 e8 dis4\trill
    e r8 e, c' h16 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    d'4^\tutti r8 d d d
    d d r d d d
    d d r h e d
    cis cis r4 dis8 dis
    e4 e8 e e4~
    e8 e e4 dis
    e r8 h e d
  }
}

SopranoLyrics = \lyricmode {
  Te, te in -- vo --
  ca -- mus, te, te lau --
  da -- mus, te ad -- o --
  ra -- mus, o be --
  a -- ta, be -- a --
  ta tri -- ni --
  tas, o tu spes
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    g'4^\tutti r8 d g fis
    g g r d g fis
    g g r g g fis
    e e e e a fis
    g4. g8 g16[ a g a]
    h8 a g4 fis8.\trill fis16
    e4 r8 g4 fis8
  }
}

AltoLyrics = \lyricmode {
  Te, te in -- vo --
  ca -- mus, te, te lau --
  da -- mus, te ad -- o --
  ra -- mus, o be -- a -- ta,
  o be -- a --
  _ ta tri -- _ ni --
  tas, o spes
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    h4^\tutti r8 g h a
    h h r g h a
    h h r h a a
    a a r4 a8 h
    h4 h8 h e[ d16 c]
    h8 c h4. h8
    h4 r8 g a a
  }
}

TenoreLyrics = \lyricmode {
  Te, te in -- vo --
  ca -- mus, te, te lau --
  da -- mus, te ad -- o --
  ra -- mus, o be --
  a -- ta, be -- a --
  _ ta tri -- ni --
  tas, o tu spes
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    g'4^\tutti r8 h g d
    g g, r h' g d
    g g, r e' cis d
    a' a, r4 fis'8 h16[ a]
    g8[ g16 fis] e8[ e16 d!] c![ c' h a]
    g8 a h[ a] h8. h16
    e,4 r8 e c d
  }
}

BassoLyrics = \lyricmode {
  Te, te in -- vo --
  ca -- mus, te, te lau --
  da -- mus, te ad -- o --
  ra -- mus, o be --
  a -- _ _
  _ ta tri -- _ ni --
  tas, o tu spes
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Andante"
    g8-\tutti g'16 fis g8 h16 a g8 d
    g, g'16 fis g8 h16 a g8 d
    g, g'16 fis e8 e16 d cis8 d
    a a'16 g a8 a16 g fis8 h16 a
    g8 g16 fis e8 e16 d! c! c' h a
    g8 a h a h h,
    e g16 fis e8 e16 d! c8 d
  }
}

BassFigures = \figuremode {
  r2.
  r
  r2 <6 5>4
  <_+>2 <6\\>8 <_+>
  <6>2.
  r4 <6 4> <5 _+>
  r2 <6 5>4
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
